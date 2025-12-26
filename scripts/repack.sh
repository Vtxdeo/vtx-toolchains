#!/bin/bash
set -e

ARCH=$1
UPSTREAM_URL=$2
INPUT_FILE=$3

if [ -z "$ARCH" ] || [ -z "$INPUT_FILE" ]; then
    echo "Usage: $0 <arch> <upstream_url> <input_tar>"
    exit 1
fi

WORK_DIR="tmp_${ARCH}_repack"
OUT_FILE="${ARCH}-linux-musl-cross.tgz"

echo ">>> [Repack] 开始处理架构: ${ARCH}"
echo ">>> [Repack] 临时目录: ${WORK_DIR}"

rm -rf "$WORK_DIR"
mkdir -p "$WORK_DIR"

echo ">>> [Repack] 解压原始文件..."
tar -xf "$INPUT_FILE" -C "$WORK_DIR" --strip-components=1

echo ">>> [Repack] 注入元数据..."
META_FILE="${WORK_DIR}/VTX_BUILD_INFO"
{
    echo "VTX_PROJECT=vtx-toolchains"
    echo "VTX_TOOLCHAIN_ARCH=${ARCH}"
    echo "VTX_SYNC_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')"
    echo "UPSTREAM_URL=${UPSTREAM_URL}"
    echo "BUILD_RUNNER_OS=$(uname -srm)"
} > "$META_FILE"

echo ">>> [Repack] 重新打包为 ${OUT_FILE} ..."
tar -C "$WORK_DIR" -czf "$OUT_FILE" .

rm -rf "$WORK_DIR"

echo ">>> [Repack] ✅ 成功生成: ${OUT_FILE}"
echo "FILE_PATH=${OUT_FILE}" >> $GITHUB_OUTPUT