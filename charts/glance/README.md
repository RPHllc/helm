To customize css:


1. we need to put out files in the /docs/internal/static folder. Because this folder was created by the original author and we want to pull his new features; we must use a file name that is unlikely to be used by the original author.
2. we chose my-style.css as the filename.

All other customizations are inside the /helm folder

To install:

1. kubectl create namespace glance

2. helm install glance helm/ -f ./helm/values.yaml -f ./helm/my-values.yaml -n glance
