#!/bin/sh

echo "Running as UID = $(id -u)";

# Read test
if [ -r /path/in/container/file.ipc ]; then
    echo "️${GREEN}✔ ok{NC} IPC file exists and is readable";
else
    echo "${RED}❌ fail${NC}: IPC file does not exist or is inaccessible";
fi

# Write test
touch /path/in/container/file.ipc
	if [ $? -ne 0 ]; then
		echo "${RED}❌ fail${NC}: Write check failed"
	else
		echo "${GREEN}✔ ok{NC}: Write check completed"
	fi
echo "Tests completed";
