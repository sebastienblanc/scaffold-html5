"use strict";

${project.projectName}.factory( "dataService", function() {
    return {
<#list entityNames as entityName>
        ${entityName?uncap_first}Pipe: AeroGear.Pipeline({
            name: "${entityName?lower_case}s"
         }).pipes.${entityName?lower_case}s,

        ${entityName?uncap_first}Store: AeroGear.DataManager({
            name: "${entityName}",
            type: "SessionLocal",
            settings: {
                 storageType: "localStorage"
            }
        }).stores.${entityName}<#if entityName_has_next>,</#if>
</#list>
    };
});