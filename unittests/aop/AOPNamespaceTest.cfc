﻿<!---
   Copyright 2010 Mark Mandel
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at
       http://www.apache.org/licenses/LICENSE-2.0
   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
 --->

<cfcomponent hint="Tests for aop namespace xml config of AOP" extends="unittests.AbstractTestCase" output="false">

<!------------------------------------------- PUBLIC ------------------------------------------->

<cffunction name="setup" hint="setup method" access="public" returntype="any" output="false">
	<cfscript>
    </cfscript>
</cffunction>

<cffunction name="testReverseAnnotationAdvisor" hint="test simple reverse advice with a annotation based advisor" access="public" returntype="void" output="false">
	<cfscript>
		var factory = createObject("component", "coldspring.beans.xml.XmlBeanFactory").init(expandPath("/unittests/testBeans/aop-namespace-advisor.xml"));

		var local = {};

		local.proxy = factory.getBean("hello");

		local.value = local.proxy.sayHello();
		assertEquals("hello", local.value);

		assertEquals(reverse("Goodbye"), local.proxy.sayGoodbye());

		local.string = "Gobble, Gobble";

		assertEquals(local.string, local.proxy.sayHello(local.string));
    </cfscript>
</cffunction>

<cffunction name="testReverseAnnotationAspect" hint="test simple reverse advice with a annotation based Aspect" access="public" returntype="void" output="false">
	<cfscript>
		var factory = createObject("component", "coldspring.beans.xml.XmlBeanFactory").init(expandPath("/unittests/testBeans/aop-namespace-aspect.xml"));

		var local = {};

		local.proxy = factory.getBean("hello");

		local.value = local.proxy.sayHello();
		assertEquals("hello", local.value);

		assertEquals(reverse("Goodbye"), local.proxy.sayGoodbye());


		local.string = "Gobble, Gobble";

		assertEquals(local.string, local.proxy.sayHello(local.string));
    </cfscript>
</cffunction>

<!------------------------------------------- PACKAGE ------------------------------------------->

<!------------------------------------------- PRIVATE ------------------------------------------->

</cfcomponent>