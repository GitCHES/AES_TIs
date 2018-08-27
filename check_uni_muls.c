#include <stdio.h>
#include <string.h>
#include <sys/types.h>
//check whether the sharing of Muls function(gf2^4 multiplier xor gf2^4 square scalar) satisfy the uniformity, where the Muls function is expressed in gf2
int main () {
	int a[4], b[4], c[4], d[4], e[4],f[4], p[4], q[4];//each bit of the 8-bit input has 4 shares
	int y1[4],y2[4],y3[4],y4[4];//output 4 bit, each bit has 4 shares
	int i,j,z;
	int s1,s2,s3,s4,s5,s6,s7,s8;
	int tt[65536];//store the the number of times that a output y1,y2,y3,y4 occurs for any given input, all possible 2^(4*4) outputs
	int m,n;
	for (m = 0; m< 16; m++) {
		for (n = 0; n< 16; n++) {	//the input (m,n), together 8 bits
			z=0;
			memset(tt,0,sizeof(tt));
			for (s1 = 0; s1< 8; s1++) {
				for ( s2 = 0;  s2< 8;  s2++) {
					for ( s3 = 0;  s3<8;  s3++) {
						for ( s4 = 0;  s4< 8;  s4++) {
							for ( s5 = 0;  s5<8 ;  s5++) {
								for ( s6 = 0;  s6< 8;  s6++) {
									for ( s7 = 0;  s7< 8;  s7++) {
										for (s8 = 0; s8< 8; s8++) {

											//each bit is divided into 4 shares by adding 3 random bits
											a[0]=(s1 & 0x4) >> 2;
											a[1]=(s1 & 0x2) >> 1 ;
											a[2]=s1 & 0x1;
											a[3] =((m & 0x8) >>3)^a[0]^a[1]^a[2];
											b[0]=(s2 & 0x4) >> 2;
											b[1]=(s2 & 0x2) >> 1 ;
											b[2]=s2 & 0x1;
											b[3] =((m & 0x4) >>2) ^b[0]^b[1]^b[2];
											c[0]=(s3 & 0x4) >> 2;
											c[1]=(s3 & 0x2) >> 1;
											c[2]=s3 & 0x1;
											c[3] =((m & 0x2) >>1) ^c[0]^c[1]^c[2];
											d[0]=(s4& 0x4) >> 2;
											d[1]=(s4& 0x2) >> 1 ;
											d[2]=s4& 0x1;
											d[3] =(m & 0x1) ^d[0]^d[1]^d[2];

											e[0]=(s5 & 0x4) >> 2;
											e[1]=(s5 & 0x2) >> 1;
											e[2]=s5 & 0x1;
											e[3] =((n & 0x8) >>3)  ^e[0]^e[1]^e[2];
											f[0]=(s6 & 0x4) >> 2;
											f[1]=(s6 & 0x2) >> 1;
											f[2]=s6 & 0x1;
											f[3] =((n & 0x4) >>2)^f[0]^f[1]^f[2];
											p[0]=(s7 & 0x4) >> 2;
											p[1]=(s7 & 0x2) >> 1;
											p[2]=s7 & 0x1;
											p[3] =((n & 0x2) >>1)^p[0]^p[1]^p[2];
											q[0]=(s8 & 0x4) >> 2;
											q[1]=(s8 & 0x2) >> 1;
											q[2]=s8 & 0x1;
											q[3] =(n & 0x1) ^q[0]^q[1]^q[2];

											y1[0]=(a[2]^a[3])&(e[1]^e[2])^(c[2]^c[3])&(e[1]^e[2])^(d[2]^d[3])&(e[1]^e[2])
											      ^(b[2]^b[3])&(f[1]^f[2])^(c[2]^c[3])&(f[1]^f[2])^(a[2]^a[3])&(p[1]^p[2])
											      ^(b[2]^b[3])&(p[1]^p[2])^(c[2]^c[3])&(p[1]^p[2])^(d[2]^d[3])&(p[1]^p[2])
											      ^(a[2]^a[3])&(q[1]^q[2])^(c[2]^c[3])&(q[1]^q[2])^b[1]^f[1]^d[1]^q[1];
											y2[0]=(b[2]^b[3])&(e[1]^e[2])^(c[2]^c[3])&(e[1]^e[2])^(a[2]^a[3])&(f[1]^f[2])
											      ^(b[2]^b[3])&(f[1]^f[2])^(d[2]^d[3])&(f[1]^f[2])^(a[2]^a[3])&(p[1]^p[2])
											      ^(c[2]^c[3])&(p[1]^p[2])^(b[2]^b[3])&(q[1]^q[2])^(d[2]^d[3])&(q[1]^q[2])^a[1]^e[1]
											      ^c[1]^p[1];
											y3[0]=(a[2]^a[3])&(e[1]^e[2])^(b[2]^b[3])&(e[1]^e[2])^(c[2]^c[3])&(e[1]^e[2])
											      ^(d[2]^d[3])&(e[1]^e[2])^(a[2]^a[3])&(f[1]^f[2])^(c[2]^c[3])&(f[1]^f[2])
											      ^(a[2]^a[3])&(p[1]^p[2])^(b[2]^b[3])&(p[1]^p[2])^(c[2]^c[3])&(p[1]^p[2])
											      ^(a[2]^a[3])&(q[1]^q[2])^(d[2]^d[3])&(q[1]^q[2])^c[1]^p[1]^d[1]^q[1];
											y4[0]=(a[2]^a[3])&(e[1]^e[2])^(c[2]^c[3])&(e[1]^e[2])^(b[2]^b[3])&(f[1]^f[2])
											      ^(d[2]^d[3])&(f[1]^f[2])^(a[2]^a[3])&(p[1]^p[2])^(d[2]^d[3])&(p[1]^p[2])
											      ^(b[2]^b[3])&(q[1]^q[2])^(c[2]^c[3])&(q[1]^q[2])^(d[2]^d[3])&(q[1]^q[2])^d[1]^q[1];

											y1[1]=(a[0]^a[2])&(e[0]^e[3])^(c[0]^c[2])&(e[0]^e[3])^(d[0]^d[2])&(e[0]^e[3])
											      ^(b[0]^b[2])&(f[0]^f[3])^(c[0]^c[2])&(f[0]^f[3])^(a[0]^a[2])&(p[0]^p[3])
											      ^(b[0]^b[2])&(p[0]^p[3])^(c[0]^c[2])&(p[0]^p[3])^(d[0]^d[2])&(p[0]^p[3])
											      ^(a[0]^a[2])&(q[0]^q[3])^(c[0]^c[2])&(q[0]^q[3])^b[0]^f[0]^d[0]^q[0];
											y2[1]=(b[0]^b[2])&(e[0]^e[3])^(c[0]^c[2])&(e[0]^e[3])^(a[0]^a[2])&(f[0]^f[3])
											      ^(b[0]^b[2])&(f[0]^f[3])^(d[0]^d[2])&(f[0]^f[3])^(a[0]^a[2])&(p[0]^p[3])
											      ^(c[0]^c[2])&(p[0]^p[3])^(b[0]^b[2])&(q[0]^q[3])^(d[0]^d[2])&(q[0]^q[3])^a[0]^e[0]
											      ^c[0]^p[0];
											y3[1]=(a[0]^a[2])&(e[0]^e[3])^(b[0]^b[2])&(e[0]^e[3])^(c[0]^c[2])&(e[0]^e[3])
											      ^(d[0]^d[2])&(e[0]^e[3])^(a[0]^a[2])&(f[0]^f[3])^(c[0]^c[2])&(f[0]^f[3])
											      ^(a[0]^a[2])&(p[0]^p[3])^(b[0]^b[2])&(p[0]^p[3])^(c[0]^c[2])&(p[0]^p[3])
											      ^(a[0]^a[2])&(q[0]^q[3])^(d[0]^d[2])&(q[0]^q[3])^c[0]^p[0]^d[0]^q[0];
											y4[1]=(a[0]^a[2])&(e[0]^e[3])^(c[0]^c[2])&(e[0]^e[3])^(b[0]^b[2])&(f[0]^f[3])
											      ^(d[0]^d[2])&(f[0]^f[3])^(a[0]^a[2])&(p[0]^p[3])^(d[0]^d[2])&(p[0]^p[3])
											      ^(b[0]^b[2])&(q[0]^q[3])^(c[0]^c[2])&(q[0]^q[3])^(d[0]^d[2])&(q[0]^q[3])^d[0]^q[0];

											y1[2]=(a[1]^a[3])&(e[0]^e[3])^(c[1]^c[3])&(e[0]^e[3])^(d[1]^d[3])&(e[0]^e[3])
											      ^(b[1]^b[3])&(f[0]^f[3])^(c[1]^c[3])&(f[0]^f[3])^(a[1]^a[3])&(p[0]^p[3])
											      ^(b[1]^b[3])&(p[0]^p[3])^(c[1]^c[3])&(p[0]^p[3])^(d[1]^d[3])&(p[0]^p[3])
											      ^(a[1]^a[3])&(q[0]^q[3])^(c[1]^c[3])&(q[0]^q[3])^b[3]^f[3]^d[3]^q[3];
											y2[2]=(b[1]^b[3])&(e[0]^e[3])^(c[1]^c[3])&(e[0]^e[3])^(a[1]^a[3])&(f[0]^f[3])
											      ^(b[1]^b[3])&(f[0]^f[3])^(d[1]^d[3])&(f[0]^f[3])^(a[1]^a[3])&(p[0]^p[3])
											      ^(c[1]^c[3])&(p[0]^p[3])^(b[1]^b[3])&(q[0]^q[3])^(d[1]^d[3])&(q[0]^q[3])^a[3]^e[3]
											      ^c[3]^p[3];
											y3[2]=(a[1]^a[3])&(e[0]^e[3])^(b[1]^b[3])&(e[0]^e[3])^(c[1]^c[3])&(e[0]^e[3])
											      ^(d[1]^d[3])&(e[0]^e[3])^(a[1]^a[3])&(f[0]^f[3])^(c[1]^c[3])&(f[0]^f[3])
											      ^(a[1]^a[3])&(p[0]^p[3])^(b[1]^b[3])&(p[0]^p[3])^(c[1]^c[3])&(p[0]^p[3])
											      ^(a[1]^a[3])&(q[0]^q[3])^(d[1]^d[3])&(q[0]^q[3])^c[3]^p[3]^d[3]^q[3];
											y4[2]=(a[1]^a[3])&(e[0]^e[3])^(c[1]^c[3])&(e[0]^e[3])^(b[1]^b[3])&(f[0]^f[3])
											      ^(d[1]^d[3])&(f[0]^f[3])^(a[1]^a[3])&(p[0]^p[3])^(d[1]^d[3])&(p[0]^p[3])
											      ^(b[1]^b[3])&(q[0]^q[3])^(c[1]^c[3])&(q[0]^q[3])^(d[1]^d[3])&(q[0]^q[3])^d[3]^q[3];

											y1[3]=(a[0]^a[1])&(e[1]^e[2])^(c[0]^c[1])&(e[1]^e[2])^(d[0]^d[1])&(e[1]^e[2])
											      ^(b[0]^b[1])&(f[1]^f[2])^(c[0]^c[1])&(f[1]^f[2])^(a[0]^a[1])&(p[1]^p[2])
											      ^(b[0]^b[1])&(p[1]^p[2])^(c[0]^c[1])&(p[1]^p[2])^(d[0]^d[1])&(p[1]^p[2])
											      ^(a[0]^a[1])&(q[1]^q[2])^(c[0]^c[1])&(q[1]^q[2])^b[2]^f[2]^d[2]^q[2];
											y2[3]=(b[0]^b[1])&(e[1]^e[2])^(c[0]^c[1])&(e[1]^e[2])^(a[0]^a[1])&(f[1]^f[2])
											      ^(b[0]^b[1])&(f[1]^f[2])^(d[0]^d[1])&(f[1]^f[2])^(a[0]^a[1])&(p[1]^p[2])
											      ^(c[0]^c[1])&(p[1]^p[2])^(b[0]^b[1])&(q[1]^q[2])^(d[0]^d[1])&(q[1]^q[2])^a[2]^e[2]
											      ^c[2]^p[2];
											y3[3]=(a[0]^a[1])&(e[1]^e[2])^(b[0]^b[1])&(e[1]^e[2])^(c[0]^c[1])&(e[1]^e[2])
											      ^(d[0]^d[1])&(e[1]^e[2])^(a[0]^a[1])&(f[1]^f[2])^(c[0]^c[1])&(f[1]^f[2])
											      ^(a[0]^a[1])&(p[1]^p[2])^(b[0]^b[1])&(p[1]^p[2])^(c[0]^c[1])&(p[1]^p[2])
											      ^(a[0]^a[1])&(q[1]^q[2])^(d[0]^d[1])&(q[1]^q[2])^c[2]^p[2]^d[2]^q[2];
											y4[3]=(a[0]^a[1])&(e[1]^e[2])^(c[0]^c[1])&(e[1]^e[2])^(b[0]^b[1])&(f[1]^f[2])
											      ^(d[0]^d[1])&(f[1]^f[2])^(a[0]^a[1])&(p[1]^p[2])^(d[0]^d[1])&(p[1]^p[2])
											      ^(b[0]^b[1])&(q[1]^q[2])^(c[0]^c[1])&(q[1]^q[2])^(d[0]^d[1])&(q[1]^q[2])^d[2]^q[2];

											i=y1[0]<<15 |y2[0]<<14 |y3[0]<<13|y4[0]<<12|y1[1]<<11 |y2[1]<<10 |y3[1]<<9|y4[1]<<8|y1[2]<<7 |y2[2]<<6 |y3[2]<<5|y4[2]<<4|y1[3]<<3 |y2[3]<<2 |y3[3]<<1|y4[3];
											tt[i]=tt[i]+1;
										}
									}
								}
							}
						}
					}
				}
			}
			for (j = 0; j< 65536; j++) {
				if(tt[j]==4096) { //the number of times that a output g1,g2,g3,g4 occurs for any given input should be 2^8(4-1)/2^4(4-1)=4096
					z=z+1;//counter
				}
				if(!(tt[j]==0|tt[j]==4096)) {  //if there is a number which not equals 4096, the sharing functions are not uniform
					//printf("%5d",tt[j]);
					printf("The sharing functions are not uniform");
				}
			}
		}
	}
	printf("The sharing functions are uniform");
	return(0);
}

/*
//check whether the sharing of Muls function(gf2^4 multiplier xor gf2^4 square scalar) satisfy the uniformity, where the Muls function is expressed in gf2^4
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
int main() {
	int x[4], y[4],u[4],v[4];
	int g[4];
	int i,j,r,s;
	int tt[65536];//store the the number of times that a output g1,g2,g3,g4 occurs for any given input, all possible 2^(4*4) outputs
	int m,z;
	for (m = 0; m< 256; m++) {
		z=0;
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

				u[0]=(x[2])^(x[3]);
				v[0]=(y[1])^(y[2]);
				g[0]=mul(u[0],v[0])^(sqsc(x[1],y[1]));

				u[1]=(x[0])^(x[2]);
				v[1]=(y[0])^(y[3]);
				g[1]=mul(u[1],v[1])^(sqsc(x[0],y[0]));

				u[2]=(x[1])^(x[3]);
				v[2]=(y[0])^(y[3]);
				g[2]=mul(u[2],v[2])^(sqsc(x[3],y[3]));

				u[3]=(x[0])^(x[1]);
				v[3]=(y[1])^(y[2]);
				g[3]=mul(u[3],v[3])^(sqsc(x[2],y[2]));

				r=g[0]<<12 |g[1]<<8 |g[2]<<4 |g[3];
				tt[r]=tt[r]+1;
			}
		}
		for (j = 0; j< 65536; j++) {
			if(tt[j]==4096) { //the number of times that a output g1,g2,g3,g4 occurs for any given input should be 2^8(4-1)/2^4(4-1)=4096
				z=z+1;//counter
			}
			if(!(tt[j]==0|tt[j]==4096)) {  //if there is a number which not equals 4096, the sharing functions are not uniform
				//printf("%5d",tt[j]);
				printf("The sharing functions are not uniform");
			}
		}
	}
	printf("The sharing functions are uniform");
	return(0);
}
*/





