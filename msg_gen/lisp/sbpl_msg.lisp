; Auto-generated. Do not edit!


(cl:in-package P3DX_sbpl-msg)


;//! \htmlinclude sbpl_msg.msg.html

(cl:defclass <sbpl_msg> (roslisp-msg-protocol:ros-message)
  ((sbpl_wait_flag
    :reader sbpl_wait_flag
    :initarg :sbpl_wait_flag
    :type cl:boolean
    :initform cl:nil)
   (sbpl_present_x
    :reader sbpl_present_x
    :initarg :sbpl_present_x
    :type cl:fixnum
    :initform 0)
   (sbpl_present_y
    :reader sbpl_present_y
    :initarg :sbpl_present_y
    :type cl:fixnum
    :initform 0)
   (sbpl_new_x
    :reader sbpl_new_x
    :initarg :sbpl_new_x
    :type cl:fixnum
    :initform 0)
   (sbpl_new_y
    :reader sbpl_new_y
    :initarg :sbpl_new_y
    :type cl:fixnum
    :initform 0)
   (start_P3DX_motion
    :reader start_P3DX_motion
    :initarg :start_P3DX_motion
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass sbpl_msg (<sbpl_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sbpl_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sbpl_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name P3DX_sbpl-msg:<sbpl_msg> is deprecated: use P3DX_sbpl-msg:sbpl_msg instead.")))

(cl:ensure-generic-function 'sbpl_wait_flag-val :lambda-list '(m))
(cl:defmethod sbpl_wait_flag-val ((m <sbpl_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:sbpl_wait_flag-val is deprecated.  Use P3DX_sbpl-msg:sbpl_wait_flag instead.")
  (sbpl_wait_flag m))

(cl:ensure-generic-function 'sbpl_present_x-val :lambda-list '(m))
(cl:defmethod sbpl_present_x-val ((m <sbpl_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:sbpl_present_x-val is deprecated.  Use P3DX_sbpl-msg:sbpl_present_x instead.")
  (sbpl_present_x m))

(cl:ensure-generic-function 'sbpl_present_y-val :lambda-list '(m))
(cl:defmethod sbpl_present_y-val ((m <sbpl_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:sbpl_present_y-val is deprecated.  Use P3DX_sbpl-msg:sbpl_present_y instead.")
  (sbpl_present_y m))

(cl:ensure-generic-function 'sbpl_new_x-val :lambda-list '(m))
(cl:defmethod sbpl_new_x-val ((m <sbpl_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:sbpl_new_x-val is deprecated.  Use P3DX_sbpl-msg:sbpl_new_x instead.")
  (sbpl_new_x m))

(cl:ensure-generic-function 'sbpl_new_y-val :lambda-list '(m))
(cl:defmethod sbpl_new_y-val ((m <sbpl_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:sbpl_new_y-val is deprecated.  Use P3DX_sbpl-msg:sbpl_new_y instead.")
  (sbpl_new_y m))

(cl:ensure-generic-function 'start_P3DX_motion-val :lambda-list '(m))
(cl:defmethod start_P3DX_motion-val ((m <sbpl_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader P3DX_sbpl-msg:start_P3DX_motion-val is deprecated.  Use P3DX_sbpl-msg:start_P3DX_motion instead.")
  (start_P3DX_motion m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sbpl_msg>) ostream)
  "Serializes a message object of type '<sbpl_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'sbpl_wait_flag) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'sbpl_present_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sbpl_present_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sbpl_new_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sbpl_new_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'start_P3DX_motion) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sbpl_msg>) istream)
  "Deserializes a message object of type '<sbpl_msg>"
    (cl:setf (cl:slot-value msg 'sbpl_wait_flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sbpl_present_x) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sbpl_present_y) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sbpl_new_x) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sbpl_new_y) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:slot-value msg 'start_P3DX_motion) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sbpl_msg>)))
  "Returns string type for a message object of type '<sbpl_msg>"
  "P3DX_sbpl/sbpl_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sbpl_msg)))
  "Returns string type for a message object of type 'sbpl_msg"
  "P3DX_sbpl/sbpl_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sbpl_msg>)))
  "Returns md5sum for a message object of type '<sbpl_msg>"
  "c5e98ef0a5b021e3e77f5108ba25b386")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sbpl_msg)))
  "Returns md5sum for a message object of type 'sbpl_msg"
  "c5e98ef0a5b021e3e77f5108ba25b386")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sbpl_msg>)))
  "Returns full string definition for message of type '<sbpl_msg>"
  (cl:format cl:nil "bool sbpl_wait_flag~%int8 sbpl_present_x~%int8 sbpl_present_y~%int8 sbpl_new_x~%int8 sbpl_new_y~%bool start_P3DX_motion~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sbpl_msg)))
  "Returns full string definition for message of type 'sbpl_msg"
  (cl:format cl:nil "bool sbpl_wait_flag~%int8 sbpl_present_x~%int8 sbpl_present_y~%int8 sbpl_new_x~%int8 sbpl_new_y~%bool start_P3DX_motion~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sbpl_msg>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sbpl_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'sbpl_msg
    (cl:cons ':sbpl_wait_flag (sbpl_wait_flag msg))
    (cl:cons ':sbpl_present_x (sbpl_present_x msg))
    (cl:cons ':sbpl_present_y (sbpl_present_y msg))
    (cl:cons ':sbpl_new_x (sbpl_new_x msg))
    (cl:cons ':sbpl_new_y (sbpl_new_y msg))
    (cl:cons ':start_P3DX_motion (start_P3DX_motion msg))
))
