/*
* JBoss, Home of Professional Open Source
* Copyright 2012, Red Hat, Inc., and individual contributors
* by the @authors tag. See the copyright.txt in the distribution for a
* full listing of individual contributors.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
* http://www.apache.org/licenses/LICENSE-2.0
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

package ${packageName};

<#list entityNames as entityName>
import ${packageName}.model.${entityName};
import ${packageName}.rest.${entityName}Endpoint;
</#list>

import org.jboss.aerogear.controller.router.AbstractRoutingModule;
import org.jboss.aerogear.controller.router.MediaType;
import org.jboss.aerogear.controller.router.RequestMethod;


public class Routes extends AbstractRoutingModule {

    @Override
    public void configuration() throws Exception {

    <#list entityNames as entityName>
        route()
                .from("/${entityName?lower_case}s")
                .on(RequestMethod.GET)
                .consumes(JSON)
                .produces(JSON)
                .to(${entityName}Endpoint.class).listAll();
        route()
                .from("/${entityName?lower_case}s")
                .on(RequestMethod.POST)
                .consumes(JSON)
                .produces(JSON)
                .to(${entityName}Endpoint.class).create(param(${entityName}.class));
        route()
                .from("/${entityName?lower_case}s/{id}")
                .on(RequestMethod.DELETE)
                .consumes(JSON)
                .produces(JSON)
                .to(${entityName}Endpoint.class).deleteById(param("id",Long.class));
        route()
                .from("/${entityName?lower_case}s/{id}")
                .on(RequestMethod.GET)
                .consumes(JSON)
                .produces(JSON)
                .to(${entityName}Endpoint.class).findById(param("id",Long.class));
        route()
                .from("/${entityName?lower_case}s/{id}")
                .on(RequestMethod.PUT)
                .consumes(JSON)
                .produces(JSON)
                .to(${entityName}Endpoint.class).update(param("id",Long.class), param(${entityName}.class));
    </#list>

    }

    private Long parseLong(String param){
        Long parsedLong = null;
        try {
            parsedLong = Long.getLong(param);
        }
        catch (NumberFormatException e){
         //TODO
        }
        finally{
             return parsedLong;
        }
    }

}

