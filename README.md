# tests repo

Load all tests with:
```bash
. bin/aliases
hfd apply
```

Then tail logs:
```bash
k logs -f -l app.kubernetes.io/name=tests,app.kubernetes.io/instance=test-shared-pod-storage
```