#include <stdio.h>
#include <tensorflow/c/c_api.h>

int main() {
	printf(
		"TensorFlow C library version: %s\n",
		TF_Version()
	);
}
