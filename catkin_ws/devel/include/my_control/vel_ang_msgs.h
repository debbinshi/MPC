// Generated by gencpp from file my_control/vel_ang_msgs.msg
// DO NOT EDIT!


#ifndef MY_CONTROL_MESSAGE_VEL_ANG_MSGS_H
#define MY_CONTROL_MESSAGE_VEL_ANG_MSGS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace my_control
{
template <class ContainerAllocator>
struct vel_ang_msgs_
{
  typedef vel_ang_msgs_<ContainerAllocator> Type;

  vel_ang_msgs_()
    : vel(0.0)
    , ang(0.0)  {
    }
  vel_ang_msgs_(const ContainerAllocator& _alloc)
    : vel(0.0)
    , ang(0.0)  {
  (void)_alloc;
    }



   typedef float _vel_type;
  _vel_type vel;

   typedef float _ang_type;
  _ang_type ang;





  typedef boost::shared_ptr< ::my_control::vel_ang_msgs_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::my_control::vel_ang_msgs_<ContainerAllocator> const> ConstPtr;

}; // struct vel_ang_msgs_

typedef ::my_control::vel_ang_msgs_<std::allocator<void> > vel_ang_msgs;

typedef boost::shared_ptr< ::my_control::vel_ang_msgs > vel_ang_msgsPtr;
typedef boost::shared_ptr< ::my_control::vel_ang_msgs const> vel_ang_msgsConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::my_control::vel_ang_msgs_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::my_control::vel_ang_msgs_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace my_control

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'my_control': ['/home/debbin/catkin_ws/src/my_control/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::my_control::vel_ang_msgs_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::my_control::vel_ang_msgs_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_control::vel_ang_msgs_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_control::vel_ang_msgs_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_control::vel_ang_msgs_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_control::vel_ang_msgs_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::my_control::vel_ang_msgs_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ed3a566fa16ba731db800e9b74c7bfe7";
  }

  static const char* value(const ::my_control::vel_ang_msgs_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xed3a566fa16ba731ULL;
  static const uint64_t static_value2 = 0xdb800e9b74c7bfe7ULL;
};

template<class ContainerAllocator>
struct DataType< ::my_control::vel_ang_msgs_<ContainerAllocator> >
{
  static const char* value()
  {
    return "my_control/vel_ang_msgs";
  }

  static const char* value(const ::my_control::vel_ang_msgs_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::my_control::vel_ang_msgs_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 vel\n\
float32 ang\n\
";
  }

  static const char* value(const ::my_control::vel_ang_msgs_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::my_control::vel_ang_msgs_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.vel);
      stream.next(m.ang);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct vel_ang_msgs_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::my_control::vel_ang_msgs_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::my_control::vel_ang_msgs_<ContainerAllocator>& v)
  {
    s << indent << "vel: ";
    Printer<float>::stream(s, indent + "  ", v.vel);
    s << indent << "ang: ";
    Printer<float>::stream(s, indent + "  ", v.ang);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MY_CONTROL_MESSAGE_VEL_ANG_MSGS_H
