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
module rt.typeinfo.ti_byte;

// byte

class TypeInfo_g : TypeInfo
{
    override to_string_t toString() 
    {
      version(NOGCSAFE)
        return to_string_t("byte");
      else
        return "byte"; 
    }
    @trusted:
    const:
    pure:
    nothrow:

    override hash_t getHash(in void* p)
    {
        return *cast(byte *)p;
    }

    override equals_t equals(in void* p1, in void* p2)
    {
        return *cast(byte *)p1 == *cast(byte *)p2;
    }

    override int compare(in void* p1, in void* p2)
    {
        return *cast(byte *)p1 - *cast(byte *)p2;
    }

    override @property size_t tsize() nothrow pure
    {
        return byte.sizeof;
    }

    override void swap(void *p1, void *p2)
    {
        byte t;

        t = *cast(byte *)p1;
        *cast(byte *)p1 = *cast(byte *)p2;
        *cast(byte *)p2 = t;
    }

    @property override Type type() nothrow pure { return Type.Byte; }
}
