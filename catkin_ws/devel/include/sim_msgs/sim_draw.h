// Generated by gencpp from file sim_msgs/sim_draw.msg
// DO NOT EDIT!


#ifndef SIM_MSGS_MESSAGE_SIM_DRAW_H
#define SIM_MSGS_MESSAGE_SIM_DRAW_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Point32.h>
#include <sim_msgs/sim_line.h>
#include <sim_msgs/sim_line.h>

namespace sim_msgs
{
template <class ContainerAllocator>
struct sim_draw_
{
  typedef sim_draw_<ContainerAllocator> Type;

  sim_draw_()
    : block_width(0.0)
    , block()
    , line_ego()
    , line_map()  {
    }
  sim_draw_(const ContainerAllocator& _alloc)
    : block_width(0.0)
    , block(_alloc)
    , line_ego(_alloc)
    , line_map(_alloc)  {
  (void)_alloc;
    }



   typedef float _block_width_type;
  _block_width_type block_width;

   typedef std::vector< ::geometry_msgs::Point32_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::geometry_msgs::Point32_<ContainerAllocator> >::other >  _block_type;
  _block_type block;

   typedef std::vector< ::sim_msgs::sim_line_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::sim_msgs::sim_line_<ContainerAllocator> >::other >  _line_ego_type;
  _line_ego_type line_ego;

   typedef std::vector< ::sim_msgs::sim_line_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::sim_msgs::sim_line_<ContainerAllocator> >::other >  _line_map_type;
  _line_map_type line_map;





  typedef boost::shared_ptr< ::sim_msgs::sim_draw_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sim_msgs::sim_draw_<ContainerAllocator> const> ConstPtr;

}; // struct sim_draw_

typedef ::sim_msgs::sim_draw_<std::allocator<void> > sim_draw;

typedef boost::shared_ptr< ::sim_msgs::sim_draw > sim_drawPtr;
typedef boost::shared_ptr< ::sim_msgs::sim_draw const> sim_drawConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sim_msgs::sim_draw_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sim_msgs::sim_draw_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace sim_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'sim_msgs': ['/home/debbin/catkin_ws/src/sim_msgs/msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::sim_msgs::sim_draw_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sim_msgs::sim_draw_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sim_msgs::sim_draw_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sim_msgs::sim_draw_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sim_msgs::sim_draw_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sim_msgs::sim_draw_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sim_msgs::sim_draw_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1ed2f3f92c3262f669836ba521b6909d";
  }

  static const char* value(const ::sim_msgs::sim_draw_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1ed2f3f92c3262f6ULL;
  static const uint64_t static_value2 = 0x69836ba521b6909dULL;
};

template<class ContainerAllocator>
struct DataType< ::sim_msgs::sim_draw_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sim_msgs/sim_draw";
  }

  static const char* value(const ::sim_msgs::sim_draw_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sim_msgs::sim_draw_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 block_width\n\
\n\
geometry_msgs/Point32[] block\n\
sim_msgs/sim_line[] line_ego\n\
sim_msgs/sim_line[] line_map\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point32\n\
# This contains the position of a point in free space(with 32 bits of precision).\n\
# It is recommeded to use Point wherever possible instead of Point32.  \n\
# \n\
# This recommendation is to promote interoperability.  \n\
#\n\
# This message is designed to take up less space when sending\n\
# lots of points at once, as in the case of a PointCloud.  \n\
\n\
float32 x\n\
float32 y\n\
float32 z\n\
================================================================================\n\
MSG: sim_msgs/sim_line\n\
geometry_msgs/Point32[] pos_array\n\
std_msgs/String color\n\
\n\
================================================================================\n\
MSG: std_msgs/String\n\
string data\n\
";
  }

  static const char* value(const ::sim_msgs::sim_draw_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sim_msgs::sim_draw_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.block_width);
      stream.next(m.block);
      stream.next(m.line_ego);
      stream.next(m.line_map);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct sim_draw_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sim_msgs::sim_draw_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sim_msgs::sim_draw_<ContainerAllocator>& v)
  {
    s << indent << "block_width: ";
    Printer<float>::stream(s, indent + "  ", v.block_width);
    s << indent << "block[]" << std::endl;
    for (size_t i = 0; i < v.block.size(); ++i)
    {
      s << indent << "  block[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::geometry_msgs::Point32_<ContainerAllocator> >::stream(s, indent + "    ", v.block[i]);
    }
    s << indent << "line_ego[]" << std::endl;
    for (size_t i = 0; i < v.line_ego.size(); ++i)
    {
      s << indent << "  line_ego[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::sim_msgs::sim_line_<ContainerAllocator> >::stream(s, indent + "    ", v.line_ego[i]);
    }
    s << indent << "line_map[]" << std::endl;
    for (size_t i = 0; i < v.line_map.size(); ++i)
    {
      s << indent << "  line_map[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::sim_msgs::sim_line_<ContainerAllocator> >::stream(s, indent + "    ", v.line_map[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // SIM_MSGS_MESSAGE_SIM_DRAW_H
