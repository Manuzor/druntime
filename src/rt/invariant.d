/**
 * Implementation of invariant support routines.
 *
 * Copyright: Copyright Digital Mars 2007 - 2010.
 * License:   <a href="http://www.boost.org/LICENSE_1_0.txt">Boost License 1.0</a>.
 * Authors:   Walter Bright
 */

/*          Copyright Digital Mars 2007 - 2010.
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */


/**
 *
 */
void _d_invariant(Object o)
{   
  version(NO_INVARIANTS)
  {
  }
  else
  {
    ClassInfo c;

    //printf("__d_invariant(%p)\n", o);

    // BUG: needs to be filename/line of caller, not library routine
    assert(o !is null); // just do null check, not invariant check

    //check if vptr is null, if so the object has already been destructed
    void** vptr = cast(void**)o;
    assert(*vptr !is null);

    c = o.classinfo;
    do
    {
        if (c.classInvariant)
        {
            (*c.classInvariant)(o);
        }
        c = c.base;
    } while (c);
  }
}
