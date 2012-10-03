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
module rt.typeinfo.ti_wchar;

// wchar

class TypeInfo_u : TypeInfo
{
    override to_string_t toString() 
    {
      version(NOGCSAFE)
        return to_string_t("wchar");
      else
        return "wchar"; 
    }
    @trusted:
    const:
    pure:
    nothrow:

    override hash_t getHash(in void* p)
    {
        return *cast(wchar *)p;
    }

    override equals_t equals(in void* p1, in void* p2)
    {
        return *cast(wchar *)p1 == *cast(wchar *)p2;
    }

    override int compare(in void* p1, in void* p2)
    {
        return *cast(wchar *)p1 - *cast(wchar *)p2;
    }

    override @property size_t tsize()
    {
        return wchar.sizeof;
    }

    override void swap(void *p1, void *p2)
    {
        wchar t;

        t = *cast(wchar *)p1;
        *cast(wchar *)p1 = *cast(wchar *)p2;
        *cast(wchar *)p2 = t;
    }

    override const(void)[] init()
    {
        static immutable wchar c;

        return (cast(wchar *)&c)[0 .. 1];
    }

    @property override Type type() nothrow pure { return Type.WChar; }
}
