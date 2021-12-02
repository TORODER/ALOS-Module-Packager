# ALOS Module Packager

ALOS 模块的打包器


## 构建

```shell

dart compile exe bin/alosmp.dart

mv bin/alosmp.exe .

/// 可选 改名为 无 .exe 后缀

mv alosmp.exe alosmp

```


## 使用


```shell 

alosmp.exe --dir {{module path dir}}

/// 例子

./alosmp.exe --dir ./example_module


或


alosmp --dir {{module path dir}}

/// 例子

./alosmp --dir ./example_module


```


## 测试

```shell

/// 成功后输出 example——module.amp 文件

sh shell/debug.sh

```
