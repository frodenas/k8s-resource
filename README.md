# Kubernetes Resource

A [Concourse](http://concourse.ci/) resource to apply [Kubernetes](http://kubernetes.io/) (k8s) resources.

## Source Configuration

| Field           | Required | Type    | Description
|:----------------|:--------:|:-------:|:-----------
| url             | Y        | String  | Kubernetes URL
| namespace       | Y        | String  | Kubernetes Namespace
| username        | N        | String  | Kubernetes Username
| password        | N        | String  | Kubernetes Password
| token           | N        | String  | Kubernetes Token
| debug           | N        | Boolean | Show detailed execution
| record          | N        | Boolean | Kubectl --record option (defaults to `false`)
| skip_tls_verify | N        | Boolean | Skip TLS certificates verification (defaults to `false`)
| cert_data       | N        | String  | TLS certificate PEM-encoded bytes
| key_data        | N        | String  | TLS certificate key PEM-encoded bytes
| ca_data         | N        | String  | TLS root certificate PEM-encoded bytes

## Behavior

### `check`: Does nothing.

### `in`: Does nothing.

### `out`: Applies a kubernetes resource.

Given a kubernetes configuration file (both `json` and `yaml` formats are accepted), applies it to a kubernetes resource.

#### Parameters

| Field     | Required | Type   | Description
|:----------|:--------:|:------:|:-----------
| spec_path | Y        | String | Path to the resource spec file to apply

## Example Configuration

### Resource Type

```yaml
resource_types:
  - name: k8s-resource
    type: docker-image
    source:
      repository: frodenas/k8s-resource
```

### Resource

``` yaml
resources:
  - name: my-kubernetes
    type: k8s-resource
    source:
      url: <KUBERNETES URL>
      username: <KUBERNETES USERNAME>
      password: <KUBERNETES PASSWORD>
      namespace: <KUBERNETES NAMESPACE>
```

### Plan

``` yaml
- put: my-kubernetes
  params:
    spec_path: my-pod-spec.yml
```

## Copyright

Copyright (c) 2016 Ferran Rodenas. See [LICENSE](https://github.com/frodenas/k8s-resource/blob/master/LICENSE) for details.
