; Auto-generated. Do not edit!


(cl:in-package P3DX_sbpl-msg)


;//! \htmlinclude sonar_msg.msg.html

(cl:defclass <sonar_msg> (roslisp-msg-protocol:ros-message)
  ((l
    :reader l
    :initarg :l
    :type cl:boolean
    :initform cl:nil)
   (fl
    :reader fl
    :initarg :fl
    :type cl:boolean
    :initform cl:nil)
   (f
    :reader f
    :initarg :f
    :type cl:boolean
    :initform cl:nil)
   (fr
    :reader fr
    :initarg :fr
    :type cl:boolean
    :initform cl:nil)
   (r
    :reader r
    :initarg :r
    :type cl:boolean
    :initform cl:nil)
   (direction
    :reader direction
    :initarg :direction
    :type cl:fixnum
    :initform 0))
)

(cl:defclass sonar_msg (<sonar_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sonar_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sonar_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name P3DX_sbpl-msg:<sonar_msg> is deprecated: use P3DX_sbpl-msg:sonar_msg instead.")))

(cl:ensure-generic-function 'l-val :lambda-list '(m))
(cl:defmethod l-val ((m <sonar_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:l-val is deprecated.  Use P3DX_sbpl-msg:l instead.")
  (l m))

(cl:ensure-generic-function 'fl-val :lambda-list '(m))
(cl:defmethod fl-val ((m <sonar_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:fl-val is deprecated.  Use P3DX_sbpl-msg:fl instead.")
  (fl m))

(cl:ensure-generic-function 'f-val :lambda-list '(m))
(cl:defmethod f-val ((m <sonar_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:f-val is deprecated.  Use P3DX_sbpl-msg:f instead.")
  (f m))

(cl:ensure-generic-function 'fr-val :lambda-list '(m))
(cl:defmethod fr-val ((m <sonar_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:fr-val is deprecated.  Use P3DX_sbpl-msg:fr instead.")
  (fr m))

(cl:ensure-generic-function 'r-val :lambda-list '(m))
(cl:defmethod r-val ((m <sonar_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:r-val is deprecated.  Use P3DX_sbpl-msg:r instead.")
  (r m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <sonar_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:direction-val is deprecated.  Use P3DX_sbpl-msg:direction instead.")
  (direction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sonar_msg>) ostream)
  "Serializes a message object of type '<sonar_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'l) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'fl) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'f) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'fr) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'r) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'direction)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sonar_msg>) istream)
  "Deserializes a message object of type '<sonar_msg>"
    (cl:setf (cl:slot-value msg 'l) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'fl) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'f) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'fr) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'r) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'direction) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sonar_msg>)))
  "Returns string type for a message object of type '<sonar_msg>"
  "P3DX_sbpl/sonar_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sonar_msg)))
  "Returns string type for a message object of type 'sonar_msg"
  "P3DX_sbpl/sonar_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sonar_msg>)))
  "Returns md5sum for a message object of type '<sonar_msg>"
  "3221f0e712ce0872a2817eb45ca4e0f2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sonar_msg)))
  "Returns md5sum for a message object of type 'sonar_msg"
  "3221f0e712ce0872a2817eb45ca4e0f2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sonar_msg>)))
  "Returns full string definition for message of type '<sonar_msg>"
  (cl:format cl:nil "bool l~%bool fl~%bool f ~%bool fr~%bool r~%int8 direction~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sonar_msg)))
  "Returns full string definition for message of type 'sonar_msg"
  (cl:format cl:nil "bool l~%bool fl~%bool f ~%bool fr~%bool r~%int8 direction~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sonar_msg>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sonar_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'sonar_msg
    (cl:cons ':l (l msg))
    (cl:cons ':fl (fl msg))
    (cl:cons ':f (f msg))
    (cl:cons ':fr (fr msg))
    (cl:cons ':r (r msg))
    (cl:cons ':direction (direction msg))
))
