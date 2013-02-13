"use strict";

${project.projectName}.factory( "dataService", function() {
    return {
<#list entityNames as entityName>
        ${entityName}Pipe: AeroGear.Pipeline({
            name: "${entityName?lower_case}s",
            settings: {
                 baseURL: "rest/"
            }
         }).pipes.${entityName?lower_case}s,
        ${entityName}Store: AeroGear.DataManager({
            name: "${entityName}",
            type: "SessionLocal",
            settings: {
                 storageType: "localStorage"
            }
        }).stores.${entityName}<#if entityName_has_next>,</#if>
</#list>
    };
});