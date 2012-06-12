/*
 * Copyright (c) 2008, Maxim Likhachev
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the University of Pennsylvania nor the names of its
 *       contributors may be used to endorse or promote products derived from
 *       this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
#include <iostream>
using namespace std;

#include "../sbpl/headers.h"
#include<ros/ros.h>
#include<P3DX_sbpl/sbpl_msg.h>
#include<P3DX_sbpl/sonar_msg.h>
#include<P3DX_sbpl/start_msg.h>
#define N 1
#define S 2
#define W 3
#define E 4       
#define NE 5		// directions 
#define NW 6
#define SE 7
#define SW 8
bool l,fl,f,fr,r; 
int direction=4; 	// Initial direction is east
bool sbpl_wait_flag=true; 
int size_x=0,size_y=0;
int startx = 0, starty = 0;
int goalx=0, goaly=0;
unsigned char obsthresh = 0;
bool start_flag=false;

int planandnavigate2d(int argc, char *argv[])
{	ros::NodeHandle sbpl_xy;
  	ros::Publisher sbpl_xy_pub;
	sbpl_xy_pub = sbpl_xy.advertise<P3DX_sbpl::sbpl_msg>("sbpl_xy",10);
	P3DX_sbpl::sbpl_msg msg; 
	double allocated_time_secs_foreachplan = 0.2; //in seconds
	MDPConfig MDPCfg;
	EnvironmentNAV2D environment_nav2D;
	EnvironmentNAV2D trueenvironment_nav2D;
	sleep(2);
  int dx[8] = {-1, -1, -1,  0,  0,  1,  1,  1};
  int dy[8] = {-1,  0,  1, -1,  1, -1,  0,  1};
	bool bPrint = true;
	int x,y;
	vector<int> preds_of_changededgesIDV;
	vector<nav2dcell_t> changedcellsV;
	nav2dcell_t nav2dcell;
	int i;

	//srand(0);
	int plantime_over1secs=0, plantime_over0p5secs=0, plantime_over0p1secs=0, plantime_over0p05secs=0, plantime_below0p05secs=0;

	//set parameters - should be done before initialization 
	if(!trueenvironment_nav2D.SetEnvParameter("is16connected", 1))
	{
		SBPL_ERROR("ERROR: failed to set parameters\n");
		throw new SBPL_Exception();
	}
	if(!environment_nav2D.SetEnvParameter("is16connected", 1))
	{
		SBPL_ERROR("ERROR: failed to set parameters\n");
		throw new SBPL_Exception();
	}


    //initialize true map and robot map
	if(!trueenvironment_nav2D.InitializeEnv(size_x,size_y,obsthresh,startx,starty, goalx,goaly))
	{
		SBPL_ERROR("ERROR: InitializeEnv failed\n");
		throw new SBPL_Exception();
	}
	
    unsigned char* map = (unsigned char*)calloc(size_x*size_y, sizeof(unsigned char));

	//print the map
	if(bPrint) printf("true map:\n");
	for(y = 0; bPrint && y < size_y; y++){
		for(x = 0; x < size_x; x++){
			printf("%d ", (int)trueenvironment_nav2D.IsObstacle(x,y));
		}
		printf("\n");
	}
	if(bPrint) printf("System Pause (return=%d)\n",system("pause"));

	//Initialize Environment (should be called before initializing anything else)
    if(!environment_nav2D.InitializeEnv(size_x, size_y, map, startx, starty, goalx, goaly, obsthresh)){
		SBPL_ERROR("ERROR: InitializeEnv failed\n");
		throw new SBPL_Exception();
	}

	//Initialize MDP Info
	if(!environment_nav2D.InitializeMDPCfg(&MDPCfg))
	{
		SBPL_ERROR("ERROR: InitializeMDPCfg failed\n");
		throw new SBPL_Exception();
	}


	//create a planner
	vector<int> solution_stateIDs_V;
	bool bforwardsearch = false;
	ADPlanner planner(&environment_nav2D, bforwardsearch);

	planner.set_initialsolution_eps(2.0);


    //set the start and goal configurations
    if(planner.set_start(MDPCfg.startstateid) == 0)
        {
            SBPL_ERROR("ERROR: failed to set start state\n");
            throw new SBPL_Exception();
        }
    if(planner.set_goal(MDPCfg.goalstateid) == 0)
        {
            SBPL_ERROR("ERROR: failed to set goal state\n");
            throw new SBPL_Exception();
        }

    //now comes the main loop /////////////////////////////////////
    int goalthresh = 0;
    while(abs(startx - goalx) > goalthresh || abs(starty - goaly) > goalthresh){

        //simulate sensor data update
        bool bChanges = false;
		preds_of_changededgesIDV.clear();
		changedcellsV.clear();
        for(i = 0; i < 8; i++){
            int x = startx + dx[i];
            int y = starty + dy[i];
            if(x < 0 || x >= size_x || y < 0 || y >= size_y)
                continue;
            int index = x + y*size_x;
		ros::spinOnce();
			unsigned char truecost = trueenvironment_nav2D.GetMapCost(x,y);
//// here map is updated based on sonar values 
            if(1){ truecost=0;
		if (direction==N) 
			{ 	{ if(((startx-x)==0)&&((starty-y)==1)) truecost=f;} 
				{ if(((startx-x)==1)&&((starty-y)==0)) truecost=l;} 
				{ if(((startx-x)==-1)&&((starty-y)==0))truecost=r;} 
				{ if(((startx-x)==1)&&((starty-y)==1)) truecost=fl;} 
				{ if(((startx-x)==-1)&&((starty-y)==1))truecost=fr;} 
			}
		if (direction==S) 
			{ 	{ if(((startx-x)==0)&&((starty-y)==-1))truecost=f;} 
				{ if(((startx-x)==-1)&&((starty-y)==0))truecost=l;} 
				{ if(((startx-x)==1)&&((starty-y)==0)) truecost=r;} 
				{ if(((startx-x)==-1)&&((starty-y)==-1))truecost=fl;} 
				{ if(((startx-x)==1)&&((starty-y)==-1)) truecost=fr;} 
			}
		if (direction==W) 
			{ 	{ if(((startx-x)==-1)&&((starty-y)==0))truecost=f;} 
				{ if(((startx-x)==0)&&((starty-y)==1))truecost=l;} 
				{ if(((startx-x)==0)&&((starty-y)==-1))truecost=r;} 
				{ if(((startx-x)==-1)&&((starty-y)==1))truecost=fl;} 
				{ if(((startx-x)==-1)&&((starty-y)==-1))truecost=fr;} 
			}
		if (direction==E) 
			{ 	{ if(((startx-x)==1)&&((starty-y)==0))truecost=f;} 
				{ if(((startx-x)==0)&&((starty-y)==-1))truecost=l;} 
				{ if(((startx-x)==0)&&((starty-y)==1))truecost=r;} 
				{ if(((startx-x)==1)&&((starty-y)==-1))truecost=fl;} 
				{ if(((startx-x)==1)&&((starty-y)==1))truecost=fr;} 
			}
		if (direction==NE) 
			{ 	{ if(((startx-x)==1)&&((starty-y)==1)) truecost=f;} 
				{ if(((startx-x)==1)&&((starty-y)==0)) truecost=l||fl;} 
				{ if(((startx-x)==0)&&((starty-y)==1))truecost=r||fr;} 
			}
		if (direction==NW) 
			{ 	{ if(((startx-x)==-1)&&((starty-y)==1))truecost=f;} 
				{ if(((startx-x)==0)&&((starty-y)==1))truecost=l||fl;} 
				{ if(((startx-x)==-1)&&((starty-y)==0)) truecost=r||fr;} 
			}
		if (direction==SW) 
			{ 	{ if(((startx-x)==-1)&&((starty-y)==-1))truecost=f;} 
				{ if(((startx-x)==-1)&&((starty-y)==0))truecost=l||fl;} 
				{ if(((startx-x)==0)&&((starty-y)==-1))truecost=r||fr;} 
			}
		if (direction==SE) 
			{ 	{ if(((startx-x)==1)&&((starty-y)==-1))truecost=f;} 
				{ if(((startx-x)==0)&&((starty-y)==-1))truecost=l||fl;} 
				{ if(((startx-x)==1)&&((starty-y)==0))truecost=r||fr;} 
			}




                map[index] = truecost;
                environment_nav2D.UpdateCost(x,y,map[index]);
                printf("setting cost[%d][%d] to %d\n", x,y,map[index]);
                bChanges = true;
				//store the changed cells
				nav2dcell.x = x;
				nav2dcell.y = y;
				changedcellsV.push_back(nav2dcell);
            }
        }
		
		double TimeStarted = clock();

        if(bChanges){
            //planner.costs_changed(); //use by ARA* planner (non-incremental)

			//get the affected states
			environment_nav2D.GetPredsofChangedEdges(&changedcellsV, &preds_of_changededgesIDV);
			//let know the incremental planner about them
			planner.update_preds_of_changededges(&preds_of_changededgesIDV); //use by AD* planner (incremental)
        }


        SBPL_FPRINTF(fSol, "%d %d ",  startx, starty);

        //plan a path 
        bool bPlanExists = false;
        while(bPlanExists == false){
            printf("new planning...\n");   
            bPlanExists = (planner.replan(allocated_time_secs_foreachplan, &solution_stateIDs_V) == 1);
            printf("done with the solution of size=%d\n", (unsigned int)solution_stateIDs_V.size());   
            environment_nav2D.PrintTimeStat(stdout);

            //for(unsigned int i = 0; i < solution_stateIDs_V.size(); i++) {
            //environment_nav2D.PrintState(solution_stateIDs_V[i], true, fSol);
            //}
            //SBPL_FPRINTF(fSol, "*********\n");
        }

		double plantime_secs = (clock()-TimeStarted)/((double)CLOCKS_PER_SEC);
		SBPL_FPRINTF(fSol, "%.5f %.5f\n", plantime_secs, planner.get_solution_eps());
		SBPL_FFLUSH(fSol);
		if(plantime_secs > 1.0)
			plantime_over1secs++;
		else if(plantime_secs > 0.5)
			plantime_over0p5secs++;
		else if(plantime_secs > 0.1)
			plantime_over0p1secs++;
		else if(plantime_secs > 0.05)
			plantime_over0p05secs++;
		else
			plantime_below0p05secs++;

		//print the map
		int startindex = startx + starty*size_x;
		int goalindex = goalx + goaly*size_x;
		for(y = 0; bPrint && y < size_y; y++){
			for(x = 0; x < size_x; x++){
				int index = x + y*size_x;

				//check to see if it is on the path
				bool bOnthePath = false;
				for(int j = 1; j < (int)solution_stateIDs_V.size(); j++)
				{
					int newx, newy;
					environment_nav2D.GetCoordFromState(solution_stateIDs_V[j], newx, newy);
					if(x == newx && y == newy)
						bOnthePath = true;
				}

				if (index != startindex && index != goalindex && !bOnthePath)
					printf("%3d ", map[index]);
				else if(index == startindex)
					printf("  R ");
				else if(index == goalindex)
					printf("  G ");
				else if (bOnthePath)
					printf("  * ");
				else
					printf("  ? ");
			}
			printf("\n");
		}
    if(bPrint) printf("System Pause (return=%d)\n",system("pause"));


        //move along the path
        if(bPlanExists && (int)solution_stateIDs_V.size() > 1){
            //get coord of the successor
            int newx, newy;
            environment_nav2D.GetCoordFromState(solution_stateIDs_V[1], newx, newy);

			if(trueenvironment_nav2D.GetMapCost(newx,newy) >= obsthresh)
			{
				SBPL_ERROR("ERROR: robot is commanded to move into an obstacle\n");
				throw new SBPL_Exception();
			}

            //Planner sends msg to P3DX_motion node to move 
            printf("moving from %d %d to %d %d\n", startx, starty, newx, newy);
		msg.sbpl_present_x=startx;
		msg.sbpl_present_y=starty;
		msg.sbpl_new_x=newx;
		msg.sbpl_new_y=newy;
		msg.start_P3DX_motion=true;
		sbpl_xy_pub.publish(msg); 
		while(sbpl_wait_flag&&ros::ok())
			{ ros::spinOnce(); 
			} 
		sbpl_wait_flag=true;
            startx = newx;
            starty = newy;
			 

            //update the environment
            environment_nav2D.SetStart(startx, starty);
            
            //update the planner
            if(planner.set_start(solution_stateIDs_V[1]) == 0){               
                SBPL_ERROR("ERROR: failed to update robot pose in the planner\n");
                throw new SBPL_Exception();
            }
        }

    }

	//print stats
	printf("stats: plantimes over 1 secs=%d; over 0.5 secs=%d; over 0.1 secs=%d; over 0.05 secs=%d; below 0.05 secs=%d\n",
		plantime_over1secs, plantime_over0p5secs, plantime_over0p1secs, plantime_over0p05secs, plantime_below0p05secs);
	SBPL_FPRINTF(fSol, "stats: plantimes over 1 secs=%d; over 0.5; secs=%d; over 0.1 secs=%d; over 0.05 secs=%d; below 0.05 secs=%d\n",
		plantime_over1secs, plantime_over0p5secs, plantime_over0p1secs, plantime_over0p05secs, plantime_below0p05secs);

	SBPL_FFLUSH(NULL);
  SBPL_FCLOSE(fSol);


    return 1;
}

void sbpl_wait_fun(const P3DX_sbpl::sbpl_msg::ConstPtr& msg)
{    
sbpl_wait_flag=msg->sbpl_wait_flag;
ROS_INFO("sbpl_wait_flag=[%d]",sbpl_wait_flag);
} 

void sonar_fun(const P3DX_sbpl::sonar_msg::ConstPtr& msg)
{/// values of sonar are updated
l =msg->l; 
fl =msg->fl; 
f =msg->f; 
fr =msg->fr; 
r =msg->r; 
direction=msg->direction; 
ROS_INFO("l=[%d] fl=[%d] f=[%d] fr=[%d] r=[%d] direction[%d]",l,fl,f,fr,r,direction);
} 


void start_fun(const P3DX_sbpl::start_msg::ConstPtr& msg)
{// start message 
size_x=msg->width;
size_y=msg->height;
startx=msg->startx;
starty=msg->starty;
goalx=msg->goalx;
goaly=msg->goaly;
obsthresh=msg->obsthresh;
start_flag=true;
ROS_INFO("width=[%d] height=[%d] startx=[%d] starty=[%d] goalx=[%d] goaly=[%d] obsthresh=[%d]",size_x,size_y,startx,starty,goalx,goaly,obsthresh);
} 


int main(int argc, char *argv[])
{

  ros::init(argc, argv, "dynamicastar");
  ros::NodeHandle n;
  
	ros::Subscriber sbpl_wait_sub = n.subscribe("sbpl_wait", 10, sbpl_wait_fun); 
	ros::Subscriber sonar_sub = n.subscribe("sonar", 10, sonar_fun); 
	ros::Subscriber sbpl_start_sub = n.subscribe("start_sbpl", 10, start_fun); 
while(ros::ok())
{ if(start_flag)    
	{ planandnavigate2d(argc, argv);
	  start_flag=false;
	} 
ros::spinOnce();
} 
    
	return 0;
}





