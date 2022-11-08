#include <stdio.h>
#include "gem5/m5ops.h"

int main() {
  m5_reset_stats(0,0);
  // Region-of-Interest (ROI)
  printf("Hello, World!\n");
  m5_dump_stats(0,0);
  return 0;
}
