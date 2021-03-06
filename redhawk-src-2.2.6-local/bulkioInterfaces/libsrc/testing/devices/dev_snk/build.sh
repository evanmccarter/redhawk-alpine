#!/bin/bash
#
# This file is protected by Copyright. Please refer to the COPYRIGHT file
# distributed with this source distribution.
#
# This file is part of REDHAWK bulkioInterfaces.
#
# REDHAWK bulkioInterfaces is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option) any
# later version.
#
# REDHAWK bulkioInterfaces is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more
# details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see http://www.gnu.org/licenses/.
#

if [ "$1" = "rpm" ]; then
    # A very simplistic RPM build scenario
    if [ -e dev_snk.spec ]; then
        mydir=`dirname $0`
        tmpdir=`mktemp -d`
        cp -r ${mydir} ${tmpdir}/dev_snk-1.0.0
        tar czf ${tmpdir}/dev_snk-1.0.0.tar.gz --exclude=".svn" -C ${tmpdir} dev_snk-1.0.0
        rpmbuild -ta ${tmpdir}/dev_snk-1.0.0.tar.gz
        rm -rf $tmpdir
    else
        echo "Missing RPM spec file in" `pwd`
        exit 1
    fi
else
    for impl in java ; do
        if [ ! -d "$impl" ]; then
            echo "Directory '$impl' does not exist...continuing"
            continue
        fi
        cd $impl
        if [ -e build.sh ]; then
            if [ $# == 1 ]; then
                if [ $1 == 'clean' ]; then
                    rm -f Makefile
                    rm -f config.*
                    ./build.sh distclean
                else
                    ./build.sh $*
                fi
            else
                ./build.sh $*
            fi
        elif [ -e Makefile ] && [ Makefile.am -ot Makefile ]; then
            make $*
        elif [ -e reconf ]; then
            ./reconf && ./configure && make $*
        else
            echo "No build.sh found for $impl"
        fi
        cd -
    done
fi
