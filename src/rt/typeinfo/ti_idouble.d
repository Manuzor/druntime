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
module rt.typeinfo.ti_idouble;

private import rt.typeinfo.ti_double;

// idouble

class TypeInfo_p : TypeInfo_d
{
    override to_string_t toString() 
    { 
      version(NOGCSAFE)
        return to_string_t("idouble");
      else
        return "idouble"; 
    }

    @property override Type type() nothrow pure { return Type.IDouble; }
}
