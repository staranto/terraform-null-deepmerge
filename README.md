# PGR

`terramform-null-deepmerge` is used by NGTF to merge together the various declaration data structures.  This usage is strictly internal to NGTF and there needs to be no awareness by the application developer.

This is a fork from Invicton-Labs/terraform-null-deepmerge.  There are a few changes in this PGR-specific implementation --

1. The workflow to build a new `depth.tf` has been moved to `build/`.

1. The default depth in that build workflow has been reduced to 10, from the parent repo's default of 100.  100 seems excessive as does, TBH, 10.  Developers aren't going to be able to keep an declaration abstraction of even 10 striaght in their minds.  But 10 is certainly more reasonable than 100.

1. The assertion to check that your data structure doesn't go beyond the depth has been removed.  This seems to be a unnecessary check and was removed to reduce any perceived clutter.

# Deepmerge

This module performs a deep map merge of standard Terraform maps/objects. It is functionally similar to the built-in `merge` function, except that it will merge maps at the same depth instead of overwriting them. It can handle maps with a depth up to 100 (see commented-out code at the bottom of `main.tf` if you want to modify it to handle deeper maps).

It functions by "flattening" each input map into a map of depth 1 where each key is the full path to the value in question. It then uses the standard merge function on these flat maps, and finally it re-builds the map structure in reverse order.

**Note:** Lists will be overwritten. Only maps are merged.

## Usage
```
locals {
  map1 = {
    key1-1 = {
      key1-1-1 = "value1-1-1"
      key1-1-2 = "value1-1-2"
      key1-1-3 = {
        key1-1-3-1 = "value1-1-3-1"
        key1-1-3-2 = "value1-1-3-2"
      }
    }
    key1-2 = "value1-2"
    key1-3 = {
      key1-3-1 = "value1-3-1"
      key1-3-2 = "value1-3-2"
    }
  }

  map2 = {
    key1-1 = {
      key1-1-1 = "value1-1-1(overwrite)"
      key1-1-3 = {
        key1-1-3-2 = "value1-1-3-2(overwrite)"
        key1-1-3-3 = {
          key1-1-3-3-1 = "value1-1-3-3-1"
        }
      }
      key1-1-4 = "value1-1-4"
    }
    key1-2 = {
      key1-2-1 = "value1-2-1"
      key1-2-2 = "value1-2-2"
      key1-2-3 = {
        key1-2-3-1 = "value1-2-3-1"
      }
    }
    key1-3 = "value1-3(overwrite)"
  }

  map3 = {
    key1-3 = "value1-3(double-overwrite)"
    key1-2 = {
      key1-2-3 = {
        key1-2-3-2 = "value1-2-3-2"
      }
    }
  }
}

module "deepmerge" {
  source  = "Invicton-Labs/deepmerge/null"
  maps = [
    local.map1,
    local.map2,
    local.map3
  ]
}

output "merged" {
  description = "The merged map."
  value       = module.deepmerge.merged
}

```

Output:
```
merged = {
  "key1-1" = {
    "key1-1-1" = "value1-1-1(overwrite)"
    "key1-1-2" = "value1-1-2"
    "key1-1-3" = {
      "key1-1-3-1" = "value1-1-3-1"
      "key1-1-3-2" = "value1-1-3-2(overwrite)"
      "key1-1-3-3" = {
        "key1-1-3-3-1" = "value1-1-3-3-1"
      }
    }
    "key1-1-4" = "value1-1-4"
  }
  "key1-2" = {
    "key1-2-1" = "value1-2-1"
    "key1-2-2" = "value1-2-2"
    "key1-2-3" = {
      "key1-2-3-1" = "value1-2-3-1"
      "key1-2-3-2" = "value1-2-3-2"
    }
  }
  "key1-3" = "value1-3(double-overwrite)"
}
```