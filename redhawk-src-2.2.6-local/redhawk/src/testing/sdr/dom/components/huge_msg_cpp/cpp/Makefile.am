#
# This file is protected by Copyright. Please refer to the COPYRIGHT file
# distributed with this source distribution.
#
# This file is part of REDHAWK core.
#
# REDHAWK core is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option) any
# later version.
#
# REDHAWK core is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more
# details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see http://www.gnu.org/licenses/.
#
CFDIR = $(top_srcdir)/base

noinst_PROGRAMS = huge_msg_cpp

huge_msg_cpp_SOURCES = huge_msg_cpp.cpp huge_msg_cpp.h huge_msg_cpp_base.cpp huge_msg_cpp_base.h main.cpp
huge_msg_cpp_CXXFLAGS = -Wall $(BOOST_CPPFLAGS) -I$(CFDIR)/include -I$(CFDIR)/include/ossie
huge_msg_cpp_LDADD = $(BOOST_REGEX_LIB) $(BOOST_SYSTEM_LIB) $(BOOST_THREAD_LIB) $(OMNIDYNAMIC_LIBS) $(OMNICOS_LIBS) $(CFDIR)/framework/libossiecf.la $(CFDIR)/framework/idl/libossieidl.la
