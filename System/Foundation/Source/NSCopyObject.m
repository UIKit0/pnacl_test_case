/** Implementation of NSCopyObject() for GNUStep
   Copyright (C) 1994, 1995 Free Software Foundation, Inc.

   Written by:  Andrew Kachites McCallum <mccallum@gnu.ai.mit.edu>
   Date: August 1994

   This file is part of the GNUstep Base Library.

   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.

   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with this library; if not, write to the Free
   Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02111 USA.

   <title>NSCopyObject class reference</title>
   $Date: 2010-09-09 08:06:09 -0700 (Thu, 09 Sep 2010) $ $Revision: 31265 $
   */

#import "common.h"

NSObject *NSCopyObject(NSObject *anObject, NSUInteger extraBytes, NSZone *zone)
{
  // Note: The cast to Class* and dereference gets the isa pointer.  This is
  // ugly, but is required because the old GNU runtime calls this
  // class_pointer, rather than isa, just to be different.
  id copy = NSAllocateObject((*(Class*)anObject), extraBytes, zone);
  memcpy(copy, anObject,
    class_getInstanceSize(object_getClass(anObject)) + extraBytes);
  return copy;
}
