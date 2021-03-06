// Generated by gencpp from file controller_msgs/result.msg
// DO NOT EDIT!


#ifndef CONTROLLER_MSGS_MESSAGE_RESULT_H
#define CONTROLLER_MSGS_MESSAGE_RESULT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace controller_msgs
{
template <class ContainerAllocator>
struct result_
{
  typedef result_<ContainerAllocator> Type;

  result_()
    : a(0.0)
    , delta(0.0)
    , vel(0.0)
    , start(false)  {
    }
  result_(const ContainerAllocator& _alloc)
    : a(0.0)
    , delta(0.0)
    , vel(0.0)
    , start(false)  {
  (void)_alloc;
    }



   typedef double _a_type;
  _a_type a;

   typedef double _delta_type;
  _delta_type delta;

   typedef double _vel_type;
  _vel_type vel;

   typedef uint8_t _start_type;
  _start_type start;





  typedef boost::shared_ptr< ::controller_msgs::result_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::controller_msgs::result_<ContainerAllocator> const> ConstPtr;

}; // struct result_

typedef ::controller_msgs::result_<std::allocator<void> > result;

typedef boost::shared_ptr< ::controller_msgs::result > resultPtr;
typedef boost::shared_ptr< ::controller_msgs::result const> resultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::controller_msgs::result_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::controller_msgs::result_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace controller_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'controller_msgs': ['/home/debbin/gitlab/controller/src/controller_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::controller_msgs::result_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::controller_msgs::result_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::controller_msgs::result_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::controller_msgs::result_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::controller_msgs::result_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::controller_msgs::result_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::controller_msgs::result_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4aabb18a1dde1b430e398f92b037e614";
  }

  static const char* value(const ::controller_msgs::result_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4aabb18a1dde1b43ULL;
  static const uint64_t static_value2 = 0x0e398f92b037e614ULL;
};

template<class ContainerAllocator>
struct DataType< ::controller_msgs::result_<ContainerAllocator> >
{
  static const char* value()
  {
    return "controller_msgs/result";
  }

  static const char* value(const ::controller_msgs::result_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::controller_msgs::result_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 a\n\
float64 delta\n\
float64 vel\n\
bool start\n\
";
  }

  static const char* value(const ::controller_msgs::result_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::controller_msgs::result_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.a);
      stream.next(m.delta);
      stream.next(m.vel);
      stream.next(m.start);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct result_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::controller_msgs::result_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::controller_msgs::result_<ContainerAllocator>& v)
  {
    s << indent << "a: ";
    Printer<double>::stream(s, indent + "  ", v.a);
    s << indent << "delta: ";
    Printer<double>::stream(s, indent + "  ", v.delta);
    s << indent << "vel: ";
    Printer<double>::stream(s, indent + "  ", v.vel);
    s << indent << "start: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.start);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CONTROLLER_MSGS_MESSAGE_RESULT_H
