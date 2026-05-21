## edit the args (only edit the part past 'iommu=pt')

`sudo grubby --update-kernel=ALL --args="i915.enable_psr=0 i915.enable_dc=0"`
to revert
`sudo grubby --update-kernel=ALL --remove-args="i915.enable_psr=0 i915.enable_dc=0"`
to check
`sudo grubby --info=DEFAULT`
