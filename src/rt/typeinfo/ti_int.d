/**
 * TypeInfo support code.
 *
 * Copyright: Copyright Digital Mars 2004 - 2009.
 * License:   <a href="http://www.boost.org/LICENSE_1_0.txt">Boost License 1.0</a>.
 * Authors:   Walter Bright
 */

/*          Copyright Digital Mars 2004 - 2009.
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module rt.typeinfo.ti_int;

// int

class TypeInfo_i : TypeInfo
{
    override to_string_t toString() 
    {
      version(NOGCSAFE)
        return to_string_t("int");
      else
        return "int"; 
    }
    @trusted:
    const:
    pure:
    nothrow:


    override size_t getHash(in void* p)
    {
        return *cast(uint *)p;
    }

    override bool equals(in void* p1, in void* p2)
    {
        return *cast(uint *)p1 == *cast(uint *)p2;
    }

    override int compare(in void* p1, in void* p2)
    {
        if (*cast(int*) p1 < *cast(int*) p2)
            return -1;
        else if (*cast(int*) p1 > *cast(int*) p2)
            return 1;
        return 0;
    }

    override @property size_t tsize() nothrow pure
    {
        return int.sizeof;
    }

    override void swap(void *p1, void *p2)
    {
        int t;

        t = *cast(int *)p1;
        *cast(int *)p1 = *cast(int *)p2;
        *cast(int *)p2 = t;
    }

    @property override Type type() nothrow pure { return Type.Int; }
}
