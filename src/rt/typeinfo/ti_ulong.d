/**
 * TypeInfo support code.
 *
 * Copyright: Copyright Digital Mars 2004 - 2009.
 * License:   <a href="http://www.boost.org/LICENSE_1_0.txt">Boost License 1.0</a>.
 * Authors:   Walter Bright
 */

/*          Copyright Digital Mars 2004 - 2009.
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module rt.typeinfo.ti_ulong;

private import rt.util.hash;

// ulong

class TypeInfo_m : TypeInfo
{
    override to_string_t toString() 
    {
      version(NOGCSAFE)
        return to_string_t("ulong");
      else
        return "ulong"; 
    }

    override hash_t getHash(in void* p)
    {
        return hashOf(p, ulong.sizeof);
    }

    override equals_t equals(in void* p1, in void* p2)
    {
        return *cast(ulong *)p1 == *cast(ulong *)p2;
    }

    override int compare(in void* p1, in void* p2)
    {
        if (*cast(ulong *)p1 < *cast(ulong *)p2)
            return -1;
        else if (*cast(ulong *)p1 > *cast(ulong *)p2)
            return 1;
        return 0;
    }

    @property override size_t tsize() nothrow pure
    {
        return ulong.sizeof;
    }

    override void swap(void *p1, void *p2)
    {
        ulong t;

        t = *cast(ulong *)p1;
        *cast(ulong *)p1 = *cast(ulong *)p2;
        *cast(ulong *)p2 = t;
    }

    @property override size_t talign() nothrow pure
    {
        return ulong.alignof;
    }

    @property override Type type() nothrow pure { return Type.Native; }
}
