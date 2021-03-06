/* Auto-generated by genmsg_cpp for file /home/abhishek/ros_workspace/abhishek/P3DX_sbpl/msg/sonar_msg.msg */
#ifndef P3DX_SBPL_MESSAGE_SONAR_MSG_H
#define P3DX_SBPL_MESSAGE_SONAR_MSG_H
#include <string>
#include <vector>
#include <map>
#include <ostream>
#include "ros/serialization.h"
#include "ros/builtin_message_traits.h"
#include "ros/message_operations.h"
#include "ros/time.h"

#include "ros/macros.h"

#include "ros/assert.h"


namespace P3DX_sbpl
{
template <class ContainerAllocator>
struct sonar_msg_ {
  typedef sonar_msg_<ContainerAllocator> Type;

  sonar_msg_()
  : l(false)
  , fl(false)
  , f(false)
  , fr(false)
  , r(false)
  , direction(0)
  {
  }

  sonar_msg_(const ContainerAllocator& _alloc)
  : l(false)
  , fl(false)
  , f(false)
  , fr(false)
  , r(false)
  , direction(0)
  {
  }

  typedef uint8_t _l_type;
  uint8_t l;

  typedef uint8_t _fl_type;
  uint8_t fl;

  typedef uint8_t _f_type;
  uint8_t f;

  typedef uint8_t _fr_type;
  uint8_t fr;

  typedef uint8_t _r_type;
  uint8_t r;

  typedef int8_t _direction_type;
  int8_t direction;


private:
  static const char* __s_getDataType_() { return "P3DX_sbpl/sonar_msg"; }
public:
  ROS_DEPRECATED static const std::string __s_getDataType() { return __s_getDataType_(); }

  ROS_DEPRECATED const std::string __getDataType() const { return __s_getDataType_(); }

private:
  static const char* __s_getMD5Sum_() { return "3221f0e712ce0872a2817eb45ca4e0f2"; }
public:
  ROS_DEPRECATED static const std::string __s_getMD5Sum() { return __s_getMD5Sum_(); }

  ROS_DEPRECATED const std::string __getMD5Sum() const { return __s_getMD5Sum_(); }

private:
  static const char* __s_getMessageDefinition_() { return "bool l\n\
bool fl\n\
bool f \n\
bool fr\n\
bool r\n\
int8 direction\n\
\n\
"; }
public:
  ROS_DEPRECATED static const std::string __s_getMessageDefinition() { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED const std::string __getMessageDefinition() const { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED virtual uint8_t *serialize(uint8_t *write_ptr, uint32_t seq) const
  {
    ros::serialization::OStream stream(write_ptr, 1000000000);
    ros::serialization::serialize(stream, l);
    ros::serialization::serialize(stream, fl);
    ros::serialization::serialize(stream, f);
    ros::serialization::serialize(stream, fr);
    ros::serialization::serialize(stream, r);
    ros::serialization::serialize(stream, direction);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint8_t *deserialize(uint8_t *read_ptr)
  {
    ros::serialization::IStream stream(read_ptr, 1000000000);
    ros::serialization::deserialize(stream, l);
    ros::serialization::deserialize(stream, fl);
    ros::serialization::deserialize(stream, f);
    ros::serialization::deserialize(stream, fr);
    ros::serialization::deserialize(stream, r);
    ros::serialization::deserialize(stream, direction);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint32_t serializationLength() const
  {
    uint32_t size = 0;
    size += ros::serialization::serializationLength(l);
    size += ros::serialization::serializationLength(fl);
    size += ros::serialization::serializationLength(f);
    size += ros::serialization::serializationLength(fr);
    size += ros::serialization::serializationLength(r);
    size += ros::serialization::serializationLength(direction);
    return size;
  }

  typedef boost::shared_ptr< ::P3DX_sbpl::sonar_msg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::P3DX_sbpl::sonar_msg_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct sonar_msg
typedef  ::P3DX_sbpl::sonar_msg_<std::allocator<void> > sonar_msg;

typedef boost::shared_ptr< ::P3DX_sbpl::sonar_msg> sonar_msgPtr;
typedef boost::shared_ptr< ::P3DX_sbpl::sonar_msg const> sonar_msgConstPtr;


template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const  ::P3DX_sbpl::sonar_msg_<ContainerAllocator> & v)
{
  ros::message_operations::Printer< ::P3DX_sbpl::sonar_msg_<ContainerAllocator> >::stream(s, "", v);
  return s;}

} // namespace P3DX_sbpl

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::P3DX_sbpl::sonar_msg_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::P3DX_sbpl::sonar_msg_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::P3DX_sbpl::sonar_msg_<ContainerAllocator> > {
  static const char* value() 
  {
    return "3221f0e712ce0872a2817eb45ca4e0f2";
  }

  static const char* value(const  ::P3DX_sbpl::sonar_msg_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x3221f0e712ce0872ULL;
  static const uint64_t static_value2 = 0xa2817eb45ca4e0f2ULL;
};

template<class ContainerAllocator>
struct DataType< ::P3DX_sbpl::sonar_msg_<ContainerAllocator> > {
  static const char* value() 
  {
    return "P3DX_sbpl/sonar_msg";
  }

  static const char* value(const  ::P3DX_sbpl::sonar_msg_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::P3DX_sbpl::sonar_msg_<ContainerAllocator> > {
  static const char* value() 
  {
    return "bool l\n\
bool fl\n\
bool f \n\
bool fr\n\
bool r\n\
int8 direction\n\
\n\
";
  }

  static const char* value(const  ::P3DX_sbpl::sonar_msg_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::P3DX_sbpl::sonar_msg_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::P3DX_sbpl::sonar_msg_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.l);
    stream.next(m.fl);
    stream.next(m.f);
    stream.next(m.fr);
    stream.next(m.r);
    stream.next(m.direction);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct sonar_msg_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::P3DX_sbpl::sonar_msg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const  ::P3DX_sbpl::sonar_msg_<ContainerAllocator> & v) 
  {
    s << indent << "l: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.l);
    s << indent << "fl: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.fl);
    s << indent << "f: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.f);
    s << indent << "fr: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.fr);
    s << indent << "r: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.r);
    s << indent << "direction: ";
    Printer<int8_t>::stream(s, indent + "  ", v.direction);
  }
};


} // namespace message_operations
} // namespace ros

#endif // P3DX_SBPL_MESSAGE_SONAR_MSG_H

