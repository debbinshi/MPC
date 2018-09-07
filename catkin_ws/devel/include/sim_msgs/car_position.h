// Generated by gencpp from file sim_msgs/car_position.msg
// DO NOT EDIT!


#ifndef SIM_MSGS_MESSAGE_CAR_POSITION_H
#define SIM_MSGS_MESSAGE_CAR_POSITION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace sim_msgs
{
template <class ContainerAllocator>
struct car_position_
{
  typedef car_position_<ContainerAllocator> Type;

  car_position_()
    : x(0.0)
    , y(0.0)
    , theta(0.0)
    , v(0.0)  {
    }
  car_position_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , theta(0.0)
    , v(0.0)  {
  (void)_alloc;
    }



   typedef double _x_type;
  _x_type x;

   typedef double _y_type;
  _y_type y;

   typedef double _theta_type;
  _theta_type theta;

   typedef double _v_type;
  _v_type v;





  typedef boost::shared_ptr< ::sim_msgs::car_position_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sim_msgs::car_position_<ContainerAllocator> const> ConstPtr;

}; // struct car_position_

typedef ::sim_msgs::car_position_<std::allocator<void> > car_position;

typedef boost::shared_ptr< ::sim_msgs::car_position > car_positionPtr;
typedef boost::shared_ptr< ::sim_msgs::car_position const> car_positionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sim_msgs::car_position_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sim_msgs::car_position_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace sim_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'sim_msgs': ['/home/debbin/catkin_ws/src/sim_msgs/msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::sim_msgs::car_position_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sim_msgs::car_position_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sim_msgs::car_position_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sim_msgs::car_position_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sim_msgs::car_position_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sim_msgs::car_position_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sim_msgs::car_position_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c8747f26ff3e8f9104802fd3f6b0900c";
  }

  static const char* value(const ::sim_msgs::car_position_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc8747f26ff3e8f91ULL;
  static const uint64_t static_value2 = 0x04802fd3f6b0900cULL;
};

template<class ContainerAllocator>
struct DataType< ::sim_msgs::car_position_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sim_msgs/car_position";
  }

  static const char* value(const ::sim_msgs::car_position_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sim_msgs::car_position_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 x\n\
float64 y\n\
float64 theta\n\
float64 v\n\
";
  }

  static const char* value(const ::sim_msgs::car_position_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sim_msgs::car_position_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.theta);
      stream.next(m.v);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct car_position_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sim_msgs::car_position_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sim_msgs::car_position_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<double>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<double>::stream(s, indent + "  ", v.y);
    s << indent << "theta: ";
    Printer<double>::stream(s, indent + "  ", v.theta);
    s << indent << "v: ";
    Printer<double>::stream(s, indent + "  ", v.v);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SIM_MSGS_MESSAGE_CAR_POSITION_H
