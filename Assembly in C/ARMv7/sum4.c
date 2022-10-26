
__asm int sum4(int a,int b, int c,int d){
  PUSH{r4, lr}
  MOV r4, r0
  ADD r4, r4, r1
  ADD r4, r4, r2
  ADD r4, r4, r3
  POP{r4, pc}
}

int main(void){
  int s = sum4(1, 2, 3, 4);
  while(1);
}
