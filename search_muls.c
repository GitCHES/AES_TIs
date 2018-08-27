//search a TI for Muls function with uniform output
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <sys/types.h>
//F2^4 multiplier
int mul(int x, int y) {
	int w;
	int a[4],b[4],c[4];
	a[0]=(x & 0x8) >> 3;
	a[1]=(x & 0x4) >> 2;
	a[2]=(x & 0x2) >> 1;
	a[3]=x & 0x1;
	b[0]=(y & 0x8) >> 3;
	b[1]=(y & 0x4) >> 2;
	b[2]=(y & 0x2) >> 1;
	b[3]=y & 0x1;
	c[0]=(a[0]&b[0])^(a[2]&b[0])^(a[3]&b[0])^(a[1]&b[1])^(a[2]&b[1])^(a[0]&b[2])^(a[1]&b[2])^(a[2]&b[2])^(a[3]&b[2])^(a[0]&b[3])^(a[2]&b[3]);
	c[1]=(a[1]&b[0])^(a[2]&b[0])^(a[0]&b[1])^(a[1]&b[1])^(a[3]&b[1])^(a[0]&b[2])^(a[2]&b[2])^(a[1]&b[3])^(a[3]&b[3]);
	c[2]=(a[0]&b[0])^(a[1]&b[0])^(a[2]&b[0])^(a[3]&b[0])^(a[0]&b[1])^(a[2]&b[1])^(a[0]&b[2])^(a[1]&b[2])^(a[2]&b[2])^(a[0]&b[3])^(a[3]&b[3]);
	c[3]=(a[0]&b[0])^(a[2]&b[0])^(a[1]&b[1])^(a[3]&b[1])^(a[0]&b[2])^(a[3]&b[2])^(a[1]&b[3])^(a[2]&b[3])^(a[3]&b[3]);
	w=c[0]<<3|c[1]<<2|c[2]<<1|c[3];
	return ( w);
}
//F2^4 square scalar
int sqsc(int x, int y) {
	int w;
	int a[4],b[4],c[4];
	a[0]=(x & 0x8) >> 3;
	a[1]=(x & 0x4) >> 2;
	a[2]=(x & 0x2) >> 1;
	a[3]=x & 0x1;
	b[0]=(y & 0x8) >> 3;
	b[1]=(y & 0x4) >> 2;
	b[2]=(y & 0x2) >> 1;
	b[3]=y & 0x1;
	c[0]=a[1]^b[1]^a[3]^b[3];
	c[1]=a[0]^b[0]^a[2]^b[2];
	c[2]=a[2]^b[2]^a[3]^b[3];
	c[3]=a[3]^b[3];
	w=c[0]<<3|c[1]<<2|c[2]<<1|c[3];
	return ( w);
}
//check whether satisfy the uniformity
int verify(int f1[],int f2[],int f3[],int f4[]) {
	int x[4], y[4],u[4],v[4];
	int g[4];
	int i,j,r,s;
	int tt[65536];//store the the number of times that a output g1,g2,g3,g4 occurs for any given input, all possible 2^(4*4) outputs
	int m;
	for (m = 0; m< 256; m++) {
		memset(tt,0,sizeof(tt));
		for ( i = 0; i< 4096; i++) {
			for ( j = 0; j< 4096;  j++) {

				//each 4-bit variable is divided into 4 shares by adding 12 random bits
				x[0]=(i & 0xf00) >> 8;
				x[1]=(i & 0xf0) >> 4;
				x[2]=i & 0xf;
				x[3] =((m & 0xf0) >>4)^x[0]^x[1]^x[2];

				y[0]=(j & 0xf00) >> 8;
				y[1]=(j & 0xf0) >> 4;
				y[2]=j & 0xf;
				y[3] =(m & 0xf)^y[0]^y[1]^y[2];

				u[0]=(f1[0]*x[1])^(f1[1]*x[2])^(f1[2]*x[3]);    //to satisfy non-completeness
				v[0]=(f1[3]*y[1])^(f1[4]*y[2])^(f1[5]*y[3]);    //to satisfy non-completeness
				g[0]=mul(u[0],v[0])^(f1[6]*sqsc(x[1],y[1]))^(f1[7]*sqsc(x[2],y[2]))^(f1[8]*sqsc(x[3],y[3]));   //the number of multiplier in gf(2^4) is the least 1

				u[1]=(f2[0]*x[0])^(f2[1]*x[2])^(f2[2]*x[3]);   //to satisfy non-completeness
				v[1]=(f2[3]*y[0])^(f2[4]*y[2])^(f2[5]*y[3]);   //to satisfy non-completeness
				g[1]=mul(u[1],v[1])^(f2[6]*sqsc(x[0],y[0]))^(f2[7]*sqsc(x[2],y[2]))^(f2[8]*sqsc(x[3],y[3]));   //the number of multiplier in gf(2^4) is the least 1

				u[2]=(f3[0]*x[0])^(f3[1]*x[1])^(f3[2]*x[3]);   //to satisfy non-completeness
				v[2]=(f3[3]*y[0])^(f3[4]*y[1])^(f3[5]*y[3]);   //to satisfy non-completeness
				g[2]=mul(u[2],v[2])^(f3[6]*sqsc(x[0],y[0]))^(f3[7]*sqsc(x[1],y[1]))^(f3[8]*sqsc(x[3],y[3]));   //the number of multiplier in gf(2^4) is the least 1

				u[3]=(f4[0]*x[0])^(f4[1]*x[1])^(f4[2]*x[2]);   //to satisfy non-completeness
				v[3]=(f4[3]*y[0])^(f4[4]*y[1])^(f4[5]*y[2]);   //to satisfy non-completeness
				g[3]=mul(u[3],v[3])^(f4[6]*sqsc(x[0],y[0]))^(f4[7]*sqsc(x[1],y[1]))^(f4[8]*sqsc(x[2],y[2]));   //the number of multiplier in gf(2^4) is the least 1

				r=g[0]<<12 |g[1]<<8 |g[2]<<4 |g[3];
				tt[r]=tt[r]+1;
			}
		}
		for (s = 0; s< 65536; s++) {
			if(!(tt[s]==0|tt[s]==4096)) {
				//the number of times that a output g1,g2,g3,g4 occurs for any given input should be 2^8(4-1)/2^4(4-1)=4096
				return(0);
			}
		}
	}
	return(1);
}
//check whether satisfy the correctness
int cor(int f1[],int f2[],int f3[],int f4[]) {
	int i;
	int x[16];
	x[0]=(f2[0]&f2[3])^(f3[0]&f3[3])^(f4[0]&f4[3]);
	x[1]=(f3[0]&f3[4])^(f4[0]&f4[4]);
	x[2]=(f2[0]&f2[4])^(f4[0]&f4[5]);
	x[3]=(f2[0]&f2[5])^(f3[0]&f3[5]);
	x[4]=(f3[1]&f3[3])^(f4[1]&f4[3]);
	x[5]=(f1[0]&f1[3])^(f3[1]&f3[4])^(f4[1]&f4[4]);
	x[6]=(f1[0]&f1[4])^(f4[1]&f4[5]);
	x[7]=(f1[0]&f1[5])^(f3[1]&f3[5]);
	x[8]=(f2[1]&f2[3])^(f4[2]&f4[3]);
	x[9]=(f1[1]&f1[3])^(f4[2]&f4[4]);
	x[10]=(f1[1]&f1[4])^(f2[1]&f2[4])^(f4[2]&f4[5]);
	x[11]=(f1[1]&f1[5])^(f2[1]&f2[5]);
	x[12]=(f2[2]&f2[3])^(f3[2]&f3[3]);
	x[13]=(f1[2]&f1[3])^(f3[2]&f3[4]);
	x[14]=(f1[2]&f1[4])^(f2[2]&f2[4]);
	x[15]=(f1[2]&f1[5])^(f2[2]&f2[5])^(f3[2]&f3[5]);
	for (i = 0; i< 16; i++) {
		if(x[i]==0) {
			return(0);
		}
	}
	return(1);
}
int main () {
	int k;
	int w1,w2,w3,w4;
	int f1[9],f2[9],f3[9],f4[9];

	for (w1=0; w1<512; w1++) {
		for (w2=0; w2<512; w2++) {
			for (w3=0; w3<256; w3++) {
				for (w4=0; w4<64; w4++) {
				//we choose w1=244,w2=428,w3=116,w4=51, one of the most efficient Muls sharings which can be verified that the gf2^4 multiplier in TI2 stage 4 satisfy the uniformity by check_uni_stage4.c
				
					f1[0]=(w1 & 0x100) >> 8;
					f1[1]=(w1 & 0x80) >> 7;
					f1[2]=(w1 & 0x40) >> 6;
					f1[3]=(w1 & 0x20) >>5;
					f1[4]=(w1 & 0x10) >> 4;
					f1[5]=(w1 & 0x8) >> 3;
					f1[6]=(w1 & 0x4)>> 2;
					f1[7]=(w1 & 0x2)>> 1;
					f1[8]=(w1 & 0x1);

					f2[0]=(w2 & 0x100) >> 8;
					f2[1]=(w2 & 0x80) >> 7;
					f2[2]=(w2 & 0x40) >> 6;
					f2[3]=(w2 & 0x20) >>5;
					f2[4]=(w2 & 0x10) >> 4;
					f2[5]=(w2 & 0x8) >> 3;
					f2[6]=(w2 & 0x4)>> 2;
					f2[7]=(w2 & 0x2)>> 1;
					f2[8]=(w2 & 0x1);

					f3[0]=(w3 & 0x80) >> 7;
					f3[1]=(w3 & 0x40) >> 6;
					f3[2]=(w3 & 0x20) >>5;
					f3[3]=(w3 & 0x10) >> 4;
					f3[4]=(w3 & 0x8) >> 3;
					f3[5]=(w3 & 0x4)>> 2;
					f3[6]=(w3 & 0x2)>> 1;
					f3[7]=(w3 & 0x1);
					f3[8]=!(f1[8]^f2[8]);

					f4[0]=(w4 & 0x20) >>5;
					f4[1]=(w4 & 0x10) >> 4;
					f4[2]=(w4 & 0x8) >> 3;
					f4[3]=(w4 & 0x4)>> 2;
					f4[4]=(w4 & 0x2)>> 1;
					f4[5]=(w4 & 0x1);
					f4[6]=!(f2[6]^f3[6]);
					f4[7]=!(f1[6]^f2[7]);
					f4[8]=!(f1[7]^f2[7]);
                    
                    //if the sharing functions satisfy correctness
					if(cor(f1,f2,f3,f4)) {
						//if the sharing functions satisfy uniformity (and non-completeness)
						if(verify(f1,f2,f3,f4)) {
							//output f_1(x)
							printf("f_1(x)=(");
							printf("%1d",f1[0]);
							printf("*x[1]+");
							printf("%1d",f1[1]);
							printf("*x[2]+");
							printf("%1d",f1[2]);
							printf("*x[3])*(");
							printf("%1d",f1[3]);
							printf("*y[1]+");
							printf("%1d",f1[4]);
							printf("*y[2]+");
							printf("%1d",f1[5]);
							printf("*y[3])+");
							printf("%1d",f1[6]);
							printf("*sqsc(x[1],y[1])+");
							printf("%1d",f1[7]);
							printf("*sqsc(x[2],y[2])+");
							printf("%1d",f1[8]);
							printf("*sqsc(x[3],y[3])");
							printf ( "\n" );

							//output f_2(x)
							printf("f_2(x)=(");
							printf("%1d",f2[0]);
							printf("*x[0]+");
							printf("%1d",f2[1]);
							printf("*x[2]+");
							printf("%1d",f2[2]);
							printf("*x[3])*(");
							printf("%1d",f2[3]);
							printf("*y[0]+");
							printf("%1d",f2[4]);
							printf("*y[2]+");
							printf("%1d",f2[5]);
							printf("*y[3])+");
							printf("%1d",f2[6]);
							printf("*sqsc(x[0],y[0])+");
							printf("%1d",f2[7]);
							printf("*sqsc(x[2],y[2])+");
							printf("%1d",f2[8]);
							printf("*sqsc(x[3],y[3])");
							printf ( "\n" );

							//output f_3(x)
							printf("f_3(x)=(");
							printf("%1d",f3[0]);
							printf("*x[0]+");
							printf("%1d",f3[1]);
							printf("*x[1]+");
							printf("%1d",f3[2]);
							printf("*x[3])*(");
							printf("%1d",f3[3]);
							printf("*y[0]+");
							printf("%1d",f3[4]);
							printf("*y[1]+");
							printf("%1d",f3[5]);
							printf("*y[3])+");
							printf("%1d",f3[6]);
							printf("*sqsc(x[0],y[0])+");
							printf("%1d",f3[7]);
							printf("*sqsc(x[1],y[1])+");
							printf("%1d",f3[8]);
							printf("*sqsc(x[3],y[3])");
							printf ( "\n" );

							//output f_4(x)
							printf("f_4(x)=(");
							printf("%1d",f4[0]);
							printf("*x[0]+");
							printf("%1d",f4[1]);
							printf("*x[1]+");
							printf("%1d",f4[2]);
							printf("*x[2])*(");
							printf("%1d",f4[3]);
							printf("*y[0]+");
							printf("%1d",f4[4]);
							printf("*y[1]+");
							printf("%1d",f4[5]);
							printf("*y[2])+");
							printf("%1d",f4[6]);
							printf("*sqsc(x[0],y[0])+");
							printf("%1d",f4[7]);
							printf("*sqsc(x[1],y[1])+");
							printf("%1d",f4[8]);
							printf("*sqsc(x[2],y[2])");
							printf ( "\n" );
						}
					}
				}
			}

		}
	}
return(0);
}


