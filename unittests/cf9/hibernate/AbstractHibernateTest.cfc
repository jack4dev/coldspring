﻿/*
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
*/

component  extends="unittests.AbstractTestCase" hint="Test case for Hibernate based orm tests"
{
	/**
     * setup
     */
    public void function setup()
    {
		super.setup();
		ormReload();
		ormClearSession();
	    //turn this off, as it mucks up Railo for some reason? We don't need it as we dropcreate anyway.
		//ormGetSession().beginTransaction();
    }

	/**
     * teardown
     */
    public void function teardown()
    {
		if(ormGetSession().getTransaction().isActive())
		{
			ormGetSession().getTransaction().rollback();
		}
	    ormClearSession();
    }
}

