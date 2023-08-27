
#include "sorth.h"



namespace sorth::internal
{


    std::ostream& operator <<(std::ostream& stream, Location location)
    {
        auto& path = location.get_path();

        if (path)
        {
            stream << path->string() << ":";
        }

        stream << location.get_line() << ":" << location.get_column();

        return stream;
    }


    Location::Location()
    : line(1),
      column(1)
    {
    }


    Location::Location(const PathPtr& path)
    : source_path(path),
      line(1),
      column(1)
    {
    }


    Location::Location(const PathPtr& path, size_t new_line, size_t new_column)
    : source_path(path),
      line(new_line),
      column(new_column)
    {
    }


    const PathPtr& Location::get_path() const
    {
        return source_path;
    }


    size_t Location::get_line() const
    {
        return line;
    }


    size_t Location::get_column() const
    {
        return column;
    }


    void Location::next()
    {
        ++column;
    }


    void Location::next_line()
    {
        ++line;
        column = 1;
    }


}
