# 非线性优化

这个章节，看名字可能有那么点唬人。非线性方程的求解，叫优化。
然后，针对这些问题，有时候。
## 曲线拟合问题

最小二乘问题

### 手写高斯牛顿

这里没有自动的过程，雅各比要自己推导。然后用到了Eigen中LDLT分解。
LDLT分解可以用于求解线性方程组。
### Ceres

这章节里面用到了Ceres Solver，Google开发的一个非线性优化的库，在谷歌的开源激光雷达slam项目cartographer中被大量使用。
所以这个包有很多Google的库的依赖。

用到了[suitesparse](https://people.engr.tamu.edu/davis/suitesparse.html)
编译这部分内容的时候比较麻烦，遇到很多问题
后来编译成功的版本，参考了[这个文章](https://www.cnblogs.com/zsilverj/p/13110987.html)，但是没有用到之前说的-lcxspares等参数。
```bash
sudo apt-get install liblapack-dev libsuitesparse-dev libcxsparse3.1.2 libgflags-dev libgoogle-glog-dev libgtest-dev

//第一步，打开sources.list
sudo gedit /etc/apt/sources.list
//第二步，将下面的源粘贴到最上方sources.list
deb http://cz.archive.ubuntu.com/ubuntu trusty main universe
//第三步，更新源
sudo apt-get update
//第四步，重新输入依赖项安装命令安装依赖项
sudo apt-get install liblapack-dev libsuitesparse-dev libcxsparse3.1.2 libgflags-dev libgoogle-glog-dev libgtest-dev
# 这里最后安装的是ceres-solver-1.13.0，因为之前安装1.14不好用。
# 感觉比较关键的是那个libxcsparse3.1.2这个包比较重要。

```
### G2O

Mac下面，OpenCV4也可以跑这章节的代码，需要支持C++11.
编译是可以的运行的时候可能会有提示库找不到的问题。

用到了个库，chrono，统计程序运行时间的一些信息。
