; Auto-generated. Do not edit!


(cl:in-package P3DX_sbpl-msg)


;//! \htmlinclude start_msg.msg.html

(cl:defclass <start_msg> (roslisp-msg-protocol:ros-message)
  ((width
    :reader width
    :initarg :width
    :type cl:fixnum
    :initform 0)
   (height
    :reader height
    :initarg :height
    :type cl:fixnum
    :initform 0)
   (startx
    :reader startx
    :initarg :startx
    :type cl:fixnum
    :initform 0)
   (starty
    :reader starty
    :initarg :starty
    :type cl:fixnum
    :initform 0)
   (goalx
    :reader goalx
    :initarg :goalx
    :type cl:fixnum
    :initform 0)
   (goaly
    :reader goaly
    :initarg :goaly
    :type cl:fixnum
    :initform 0)
   (obsthresh
    :reader obsthresh
    :initarg :obsthresh
    :type cl:integer
    :initform 0))
)

(cl:defclass start_msg (<start_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <start_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'start_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name P3DX_sbpl-msg:<start_msg> is deprecated: use P3DX_sbpl-msg:start_msg instead.")))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <start_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:width-val is deprecated.  Use P3DX_sbpl-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <start_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:height-val is deprecated.  Use P3DX_sbpl-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'startx-val :lambda-list '(m))
(cl:defmethod startx-val ((m <start_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:startx-val is deprecated.  Use P3DX_sbpl-msg:startx instead.")
  (startx m))

(cl:ensure-generic-function 'starty-val :lambda-list '(m))
(cl:defmethod starty-val ((m <start_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:starty-val is deprecated.  Use P3DX_sbpl-msg:starty instead.")
  (starty m))

(cl:ensure-generic-function 'goalx-val :lambda-list '(m))
(cl:defmethod goalx-val ((m <start_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:goalx-val is deprecated.  Use P3DX_sbpl-msg:goalx instead.")
  (goalx m))

(cl:ensure-generic-function 'goaly-val :lambda-list '(m))
(cl:defmethod goaly-val ((m <start_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:goaly-val is deprecated.  Use P3DX_sbpl-msg:goaly instead.")
  (goaly m))

(cl:ensure-generic-function 'obsthresh-val :lambda-list '(m))
(cl:defmethod obsthresh-val ((m <start_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:obsthresh-val is deprecated.  Use P3DX_sbpl-msg:obsthresh instead.")
  (obsthresh m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <start_msg>) ostream)
  "Serializes a message object of type '<start_msg>"
  (cl:let* ((signed (cl:slot-value msg 'width)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'height)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'startx)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'starty)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'goalx)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'goaly)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'obsthresh)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <start_msg>) istream)
  "Deserializes a message object of type '<start_msg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'width) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'height) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'startx) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'starty) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'goalx) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'goaly) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'obsthresh)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<start_msg>)))
  "Returns string type for a message object of type '<start_msg>"
  "P3DX_sbpl/start_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'start_msg)))
  "Returns string type for a message object of type 'start_msg"
  "P3DX_sbpl/start_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<start_msg>)))
  "Returns md5sum for a message object of type '<start_msg>"
  "18d88bbdb2a157a3376fd0d1b689d3b3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'start_msg)))
  "Returns md5sum for a message object of type 'start_msg"
  "18d88bbdb2a157a3376fd0d1b689d3b3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<start_msg>)))
  "Returns full string definition for message of type '<start_msg>"
  (cl:format cl:nil "int8 width ~%int8 height~%int8 startx~%int8 starty~%int8 goalx~%int8 goaly~%char obsthresh~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'start_msg)))
  "Returns full string definition for message of type 'start_msg"
  (cl:format cl:nil "int8 width ~%int8 height~%int8 startx~%int8 starty~%int8 goalx~%int8 goaly~%char obsthresh~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <start_msg>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <start_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'start_msg
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
    (cl:cons ':startx (startx msg))
    (cl:cons ':starty (starty msg))
    (cl:cons ':goalx (goalx msg))
    (cl:cons ':goaly (goaly msg))
    (cl:cons ':obsthresh (obsthresh msg))
))
