xquery version "1.0-ml";
(:
 : cq
 :
 : Copyright (c) 2002-2011 MarkLogic Corporation. All Rights Reserved.
 :
 : Licensed under the Apache License, Version 2.0 (the "License");
 : you may not use this file except in compliance with the License.
 : You may obtain a copy of the License at
 :
 : http://www.apache.org/licenses/LICENSE-2.0
 :
 : Unless required by applicable law or agreed to in writing, software
 : distributed under the License is distributed on an "AS IS" BASIS,
 : WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 : See the License for the specific language governing permissions and
 : limitations under the License.
 :
 : The use of the Apache License does not indicate that this project is
 : affiliated with the Apache Software Foundation.
 :)

import module namespace c = "com.marklogic.developer.cq.controller"
 at "lib-controller.xqy";

import module namespace d = "com.marklogic.developer.cq.debug"
 at "lib-debug.xqy";

declare option xdmp:mapping "false";

declare variable $ID as xs:string := xdmp:get-request-field("ID");

d:check-debug()
,
(: add file-disposition to prompt a save dialog :)
xdmp:add-response-header(
  'Content-disposition',
  concat('attachment; filename=', $ID, '.xml') ),
(: returns the session as xml :)
c:session-export($ID)

(: session-export.xqy :)
