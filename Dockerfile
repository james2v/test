# 使用 Ubuntu 20.04 镜像作为基础镜像  
FROM ubuntu:20.04  
  
# 更新软件包列表并安装必要的依赖项  
RUN apt-get update && apt-get install -y \  
    wget \  
    ca-certificates \  
    python3.8 \  
    python3-pip  
  
# 下载 Miniconda 安装包并执行安装  
RUN wget -O miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \  
    && chmod +x miniconda.sh \  
    && ./miniconda.sh -b -p /miniconda \  
    && rm miniconda.sh  
  
# 将 Miniconda 的路径添加到环境变量中  
ENV PATH="/miniconda/bin:$PATH"  
  
# 验证安装成功  
RUN python3 --version && conda --version



