

### shinyDirChoose()

- ID要放入reactive()中
- 输出是key为 “path”与”root“的list
- 通过$path[-1]获取子目录

```
$path
$path[[1]]
[1] ""

$path[[2]]
[1] "data"

$root
[1] "Windows (C:)"
```

