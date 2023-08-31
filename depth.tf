locals {
    mod0toparse = [
        for map_idx in range(0, length(local.input_maps)):
        [{
            path = [], 
            value = local.input_maps[map_idx]
        }]
    ]
    mod0 = [
        for map_idx in range(0, length(local.input_maps)):
        {
            fields = concat([], [
                for item in local.mod0toparse[map_idx]:
                [
                    for key in keys(item["value"]):
                    {
                        key = jsonencode(concat(item["path"], [key])),
                        path = concat(item["path"], [key]),
                        value = item["value"][key],
                        is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
                    }
                ]
            ]...)
            remaining = concat([], [
                for item in local.mod0toparse[map_idx]:
                [
                    for key in keys(item["value"]):
                    {
                        path = concat(item["path"], [key]),
                        value = item["value"][key]
                    }
                    if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
                ]
            ]...)
        }
    ]
    mod1 = [
        for map_idx in range(0, length(local.input_maps)):
        {
            fields = concat([], [
                for item in local.mod0[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        key = jsonencode(concat(item["path"], [key])),
                        path = concat(item["path"], [key]),
                        value = item["value"][key],
                        is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
                    }
                ]
            ]...)
            remaining = concat([], [
                for item in local.mod0[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        path = concat(item["path"], [key]),
                        value = item["value"][key]
                    }
                    if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
                ]
            ]...)
        }
    ]
    mod2 = [
        for map_idx in range(0, length(local.input_maps)):
        {
            fields = concat([], [
                for item in local.mod1[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        key = jsonencode(concat(item["path"], [key])),
                        path = concat(item["path"], [key]),
                        value = item["value"][key],
                        is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
                    }
                ]
            ]...)
            remaining = concat([], [
                for item in local.mod1[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        path = concat(item["path"], [key]),
                        value = item["value"][key]
                    }
                    if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
                ]
            ]...)
        }
    ]
    mod3 = [
        for map_idx in range(0, length(local.input_maps)):
        {
            fields = concat([], [
                for item in local.mod2[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        key = jsonencode(concat(item["path"], [key])),
                        path = concat(item["path"], [key]),
                        value = item["value"][key],
                        is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
                    }
                ]
            ]...)
            remaining = concat([], [
                for item in local.mod2[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        path = concat(item["path"], [key]),
                        value = item["value"][key]
                    }
                    if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
                ]
            ]...)
        }
    ]
    mod4 = [
        for map_idx in range(0, length(local.input_maps)):
        {
            fields = concat([], [
                for item in local.mod3[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        key = jsonencode(concat(item["path"], [key])),
                        path = concat(item["path"], [key]),
                        value = item["value"][key],
                        is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
                    }
                ]
            ]...)
            remaining = concat([], [
                for item in local.mod3[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        path = concat(item["path"], [key]),
                        value = item["value"][key]
                    }
                    if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
                ]
            ]...)
        }
    ]
    mod5 = [
        for map_idx in range(0, length(local.input_maps)):
        {
            fields = concat([], [
                for item in local.mod4[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        key = jsonencode(concat(item["path"], [key])),
                        path = concat(item["path"], [key]),
                        value = item["value"][key],
                        is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
                    }
                ]
            ]...)
            remaining = concat([], [
                for item in local.mod4[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        path = concat(item["path"], [key]),
                        value = item["value"][key]
                    }
                    if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
                ]
            ]...)
        }
    ]
    mod6 = [
        for map_idx in range(0, length(local.input_maps)):
        {
            fields = concat([], [
                for item in local.mod5[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        key = jsonencode(concat(item["path"], [key])),
                        path = concat(item["path"], [key]),
                        value = item["value"][key],
                        is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
                    }
                ]
            ]...)
            remaining = concat([], [
                for item in local.mod5[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        path = concat(item["path"], [key]),
                        value = item["value"][key]
                    }
                    if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
                ]
            ]...)
        }
    ]
    mod7 = [
        for map_idx in range(0, length(local.input_maps)):
        {
            fields = concat([], [
                for item in local.mod6[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        key = jsonencode(concat(item["path"], [key])),
                        path = concat(item["path"], [key]),
                        value = item["value"][key],
                        is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
                    }
                ]
            ]...)
            remaining = concat([], [
                for item in local.mod6[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        path = concat(item["path"], [key]),
                        value = item["value"][key]
                    }
                    if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
                ]
            ]...)
        }
    ]
    mod8 = [
        for map_idx in range(0, length(local.input_maps)):
        {
            fields = concat([], [
                for item in local.mod7[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        key = jsonencode(concat(item["path"], [key])),
                        path = concat(item["path"], [key]),
                        value = item["value"][key],
                        is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
                    }
                ]
            ]...)
            remaining = concat([], [
                for item in local.mod7[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        path = concat(item["path"], [key]),
                        value = item["value"][key]
                    }
                    if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
                ]
            ]...)
        }
    ]
    mod9 = [
        for map_idx in range(0, length(local.input_maps)):
        {
            fields = concat([], [
                for item in local.mod8[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        key = jsonencode(concat(item["path"], [key])),
                        path = concat(item["path"], [key]),
                        value = item["value"][key],
                        is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
                    }
                ]
            ]...)
            remaining = concat([], [
                for item in local.mod8[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        path = concat(item["path"], [key]),
                        value = item["value"][key]
                    }
                    if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
                ]
            ]...)
        }
    ]
    mod10 = [
        for map_idx in range(0, length(local.input_maps)):
        {
            fields = concat([], [
                for item in local.mod9[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        key = jsonencode(concat(item["path"], [key])),
                        path = concat(item["path"], [key]),
                        value = item["value"][key],
                        is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
                    }
                ]
            ]...)
            remaining = concat([], [
                for item in local.mod9[map_idx].remaining:
                [
                    for key in keys(item["value"]):
                    {
                        path = concat(item["path"], [key]),
                        value = item["value"][key]
                    }
                    if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
                ]
            ]...)
        }
    ]

    modules = [
        local.mod0,
        local.mod1,
        local.mod2,
        local.mod3,
        local.mod4,
        local.mod5,
        local.mod6,
        local.mod7,
        local.mod8,
        local.mod9,
        local.mod10,
    ]

    m11 = {}
    m10 = {
        for field in lookup(local.merged_fields_by_depth, 9, {}):
        field.key => {final_val = field.value, sub_val = {
            for subfield in lookup(local.merged_fields_by_depth, 10, {}):
            subfield.path[length(subfield.path) - 1] => lookup(local.m11, subfield.key, subfield.value)
            if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
        }}[field.is_final ? "final_val" : "sub_val"]
    }
    m9 = {
        for field in lookup(local.merged_fields_by_depth, 8, {}):
        field.key => {final_val = field.value, sub_val = {
            for subfield in lookup(local.merged_fields_by_depth, 9, {}):
            subfield.path[length(subfield.path) - 1] => lookup(local.m10, subfield.key, subfield.value)
            if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
        }}[field.is_final ? "final_val" : "sub_val"]
    }
    m8 = {
        for field in lookup(local.merged_fields_by_depth, 7, {}):
        field.key => {final_val = field.value, sub_val = {
            for subfield in lookup(local.merged_fields_by_depth, 8, {}):
            subfield.path[length(subfield.path) - 1] => lookup(local.m9, subfield.key, subfield.value)
            if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
        }}[field.is_final ? "final_val" : "sub_val"]
    }
    m7 = {
        for field in lookup(local.merged_fields_by_depth, 6, {}):
        field.key => {final_val = field.value, sub_val = {
            for subfield in lookup(local.merged_fields_by_depth, 7, {}):
            subfield.path[length(subfield.path) - 1] => lookup(local.m8, subfield.key, subfield.value)
            if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
        }}[field.is_final ? "final_val" : "sub_val"]
    }
    m6 = {
        for field in lookup(local.merged_fields_by_depth, 5, {}):
        field.key => {final_val = field.value, sub_val = {
            for subfield in lookup(local.merged_fields_by_depth, 6, {}):
            subfield.path[length(subfield.path) - 1] => lookup(local.m7, subfield.key, subfield.value)
            if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
        }}[field.is_final ? "final_val" : "sub_val"]
    }
    m5 = {
        for field in lookup(local.merged_fields_by_depth, 4, {}):
        field.key => {final_val = field.value, sub_val = {
            for subfield in lookup(local.merged_fields_by_depth, 5, {}):
            subfield.path[length(subfield.path) - 1] => lookup(local.m6, subfield.key, subfield.value)
            if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
        }}[field.is_final ? "final_val" : "sub_val"]
    }
    m4 = {
        for field in lookup(local.merged_fields_by_depth, 3, {}):
        field.key => {final_val = field.value, sub_val = {
            for subfield in lookup(local.merged_fields_by_depth, 4, {}):
            subfield.path[length(subfield.path) - 1] => lookup(local.m5, subfield.key, subfield.value)
            if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
        }}[field.is_final ? "final_val" : "sub_val"]
    }
    m3 = {
        for field in lookup(local.merged_fields_by_depth, 2, {}):
        field.key => {final_val = field.value, sub_val = {
            for subfield in lookup(local.merged_fields_by_depth, 3, {}):
            subfield.path[length(subfield.path) - 1] => lookup(local.m4, subfield.key, subfield.value)
            if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
        }}[field.is_final ? "final_val" : "sub_val"]
    }
    m2 = {
        for field in lookup(local.merged_fields_by_depth, 1, {}):
        field.key => {final_val = field.value, sub_val = {
            for subfield in lookup(local.merged_fields_by_depth, 2, {}):
            subfield.path[length(subfield.path) - 1] => lookup(local.m3, subfield.key, subfield.value)
            if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
        }}[field.is_final ? "final_val" : "sub_val"]
    }
    m1 = {
        for field in lookup(local.merged_fields_by_depth, 0, {}):
        field.key => {final_val = field.value, sub_val = {
            for subfield in lookup(local.merged_fields_by_depth, 1, {}):
            subfield.path[length(subfield.path) - 1] => lookup(local.m2, subfield.key, subfield.value)
            if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
        }}[field.is_final ? "final_val" : "sub_val"]
    }
}
