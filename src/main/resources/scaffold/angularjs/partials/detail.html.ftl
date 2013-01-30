<form id="new-${entityName}" name="new${entityName}" class="form-horizontal">
    <#list properties as property>
    <div class="control-group">
        <#if (property.hidden!"false") == "false">
        <label for="${property.name}" class="control-label">${property.name}</label>
        <div class="controls">
            <#if property.required!"false" == "true">
            <input id="${property.name}" name="${property.name}" <#if property.type == "number">type="number"</#if><#if (property["datetime-type"]!"") == "date">type="date"</#if><#if (property["datetime-type"]!"") == "time">type="time"</#if><#if (property["datetime-type"]!"") == "both">type="datetime"</#if><#if property.type != "number" && (property["datetime-type"]!"") == "">type="text"</#if> required ng-model="${entityName?lower_case}.${property.name}" placeholder="Enter the ${entityName} ${property.name}"></input>
            </#if>
            <#if property.required!"false" == "false">
            <input id="${property.name}" name="${property.name}" <#if property.type == "number">type="number"</#if><#if (property["datetime-type"]!"") == "date">type="date"</#if><#if (property["datetime-type"]!"") == "time">type="time"</#if><#if (property["datetime-type"]!"") == "both">type="datetime"</#if><#if property.type != "number" && (property["datetime-type"]!"") == "">type="text"</#if> ng-model="${entityName?lower_case}.${property.name}" placeholder="Enter the ${entityName} ${property.name}"></input>
            </#if>
        </div>
        </#if>
    </div>
    </#list>
    <div class="control-group">
        <div class="controls">
            <button id="save${entityName}" name="save${entityName}" class="btn btn-primary" ng-disabled="isClean() || new${entityName}.$invalid" ng-click="save()"><i class="icon-ok-sign icon-white"></i> Save</button>
            <button id="cancel" name="cancel" class="btn" ng-click="cancel()"><i class="icon-remove-sign"></i> Cancel</button>
            <button id="delete${entityName}" name="delete${entityName}" class="btn" ng-show="${entityName?lower_case}.id" ng-click="delete()"><i class="icon-trash"></i> Delete</button>
        </div>
    <div>
</form>