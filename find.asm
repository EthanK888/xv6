
_find:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    break;
  }
  close(fd);
}

int main(int argc, char *argv[]){
   0:	f3 0f 1e fb          	endbr32
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	push   -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	53                   	push   %ebx
  14:	51                   	push   %ecx
  15:	83 ec 28             	sub    $0x28,%esp
  18:	8b 01                	mov    (%ecx),%eax
  1a:	8b 79 04             	mov    0x4(%ecx),%edi
  1d:	89 45 dc             	mov    %eax,-0x24(%ebp)
  20:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  //If only find is entered, call find with no flags (null pointers) and . as directory
  if(argc < 2) find(".", (void *)0, (void *)0, (void *)0, 0);
  23:	83 f8 01             	cmp    $0x1,%eax
  26:	0f 8e 7c 01 00 00    	jle    1a8 <main+0x1a8>
  //If any other args are entered, allow them to appear in any order
  else{
    //Assign null pointers to flags if nothing is entered
    char *path = malloc(DIRSIZ);
  2c:	83 ec 0c             	sub    $0xc,%esp
    char *name = (void *)0;
    char *type = (void *)0;
    char *inum = (void *)0;
    int printi = 0;

    for(int i = 1; i < argc; i++){
  2f:	bb 01 00 00 00       	mov    $0x1,%ebx
    char *path = malloc(DIRSIZ);
  34:	6a 0e                	push   $0xe
  36:	e8 85 0e 00 00       	call   ec0 <malloc>
    int printi = 0;
  3b:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    char *path = malloc(DIRSIZ);
  42:	83 c4 10             	add    $0x10,%esp
  45:	89 45 c8             	mov    %eax,-0x38(%ebp)
      }
      //Check for inum flag
      else if(strcmp(argv[i], "-inum") == 0 && inum == (void *)0){
        inum = malloc(DIRSIZ);
        
        if(i == argc - 1){
  48:	8b 45 dc             	mov    -0x24(%ebp),%eax
    char *inum = (void *)0;
  4b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
        if(i == argc - 1){
  52:	83 e8 01             	sub    $0x1,%eax
    char *type = (void *)0;
  55:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    char *name = (void *)0;
  5c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
        if(i == argc - 1){
  63:	89 45 cc             	mov    %eax,-0x34(%ebp)
  66:	e9 90 00 00 00       	jmp    fb <main+0xfb>
  6b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      if(strcmp(argv[i], "-name") == 0 && name == (void *)0){
  70:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  73:	8d 3c 9d 00 00 00 00 	lea    0x0(,%ebx,4),%edi
  7a:	83 ec 08             	sub    $0x8,%esp
  7d:	68 32 10 00 00       	push   $0x1032
  82:	8d 34 38             	lea    (%eax,%edi,1),%esi
  85:	ff 36                	push   (%esi)
  87:	e8 44 08 00 00       	call   8d0 <strcmp>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	0b 45 e0             	or     -0x20(%ebp),%eax
  92:	0f 84 2d 01 00 00    	je     1c5 <main+0x1c5>
      else if(strcmp(argv[i], "-type") == 0 && type == (void *)0){
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 38 10 00 00       	push   $0x1038
  a0:	ff 36                	push   (%esi)
  a2:	e8 29 08 00 00       	call   8d0 <strcmp>
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	0b 45 d8             	or     -0x28(%ebp),%eax
  ad:	0f 84 3e 01 00 00    	je     1f1 <main+0x1f1>
      else if(strcmp(argv[i], "-inum") == 0 && inum == (void *)0){
  b3:	83 ec 08             	sub    $0x8,%esp
  b6:	68 3e 10 00 00       	push   $0x103e
  bb:	ff 36                	push   (%esi)
  bd:	e8 0e 08 00 00       	call   8d0 <strcmp>
  c2:	83 c4 10             	add    $0x10,%esp
  c5:	0b 45 d4             	or     -0x2c(%ebp),%eax
  c8:	0f 84 a3 01 00 00    	je     271 <main+0x271>
        memmove(inum, argv[i+1], strlen(argv[i+1]));
        i++;
        continue;
      }
      //Check for printi flag
      else if(strcmp(argv[i], "-printi") == 0) printi = 1;
  ce:	83 ec 08             	sub    $0x8,%esp
  d1:	68 44 10 00 00       	push   $0x1044
  d6:	ff 36                	push   (%esi)
  d8:	e8 f3 07 00 00       	call   8d0 <strcmp>
  dd:	83 c4 10             	add    $0x10,%esp
  e0:	85 c0                	test   %eax,%eax
  e2:	0f 85 69 02 00 00    	jne    351 <main+0x351>
  e8:	c7 45 d0 01 00 00 00 	movl   $0x1,-0x30(%ebp)
    for(int i = 1; i < argc; i++){
  ef:	83 c3 01             	add    $0x1,%ebx
  f2:	39 5d dc             	cmp    %ebx,-0x24(%ebp)
  f5:	0f 8e f2 01 00 00    	jle    2ed <main+0x2ed>
      if(i == 1 && strcmp(argv[1], "-name") != 0 && strcmp(argv[1], "-type") != 0 && strcmp(argv[1], "-inum") != 0 && strcmp(argv[1], "-printi") != 0){
  fb:	83 fb 01             	cmp    $0x1,%ebx
  fe:	0f 85 6c ff ff ff    	jne    70 <main+0x70>
 104:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 107:	83 ec 08             	sub    $0x8,%esp
 10a:	68 32 10 00 00       	push   $0x1032
 10f:	ff 70 04             	push   0x4(%eax)
 112:	e8 b9 07 00 00       	call   8d0 <strcmp>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	85 c0                	test   %eax,%eax
 11c:	75 1a                	jne    138 <main+0x138>
      else if(i == 1) memmove(path, ".", 1);
 11e:	83 ec 04             	sub    $0x4,%esp
 121:	6a 01                	push   $0x1
 123:	68 30 10 00 00       	push   $0x1030
 128:	ff 75 c8             	push   -0x38(%ebp)
 12b:	e8 a0 09 00 00       	call   ad0 <memmove>
 130:	83 c4 10             	add    $0x10,%esp
 133:	e9 38 ff ff ff       	jmp    70 <main+0x70>
      if(i == 1 && strcmp(argv[1], "-name") != 0 && strcmp(argv[1], "-type") != 0 && strcmp(argv[1], "-inum") != 0 && strcmp(argv[1], "-printi") != 0){
 138:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 13b:	52                   	push   %edx
 13c:	52                   	push   %edx
 13d:	68 38 10 00 00       	push   $0x1038
 142:	ff 70 04             	push   0x4(%eax)
 145:	e8 86 07 00 00       	call   8d0 <strcmp>
 14a:	83 c4 10             	add    $0x10,%esp
 14d:	85 c0                	test   %eax,%eax
 14f:	74 cd                	je     11e <main+0x11e>
 151:	50                   	push   %eax
 152:	50                   	push   %eax
 153:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 156:	68 3e 10 00 00       	push   $0x103e
 15b:	ff 70 04             	push   0x4(%eax)
 15e:	e8 6d 07 00 00       	call   8d0 <strcmp>
 163:	83 c4 10             	add    $0x10,%esp
 166:	85 c0                	test   %eax,%eax
 168:	74 b4                	je     11e <main+0x11e>
 16a:	50                   	push   %eax
 16b:	50                   	push   %eax
 16c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 16f:	68 44 10 00 00       	push   $0x1044
 174:	ff 70 04             	push   0x4(%eax)
 177:	e8 54 07 00 00       	call   8d0 <strcmp>
 17c:	83 c4 10             	add    $0x10,%esp
 17f:	85 c0                	test   %eax,%eax
 181:	74 9b                	je     11e <main+0x11e>
        memmove(path, argv[1], strlen(argv[1]));
 183:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 186:	83 ec 0c             	sub    $0xc,%esp
 189:	ff 77 04             	push   0x4(%edi)
 18c:	e8 8f 07 00 00       	call   920 <strlen>
 191:	83 c4 0c             	add    $0xc,%esp
 194:	50                   	push   %eax
 195:	ff 77 04             	push   0x4(%edi)
 198:	ff 75 c8             	push   -0x38(%ebp)
 19b:	e8 30 09 00 00       	call   ad0 <memmove>
        continue;
 1a0:	83 c4 10             	add    $0x10,%esp
 1a3:	e9 47 ff ff ff       	jmp    ef <main+0xef>
  if(argc < 2) find(".", (void *)0, (void *)0, (void *)0, 0);
 1a8:	83 ec 0c             	sub    $0xc,%esp
 1ab:	6a 00                	push   $0x0
 1ad:	6a 00                	push   $0x0
 1af:	6a 00                	push   $0x0
 1b1:	6a 00                	push   $0x0
 1b3:	68 30 10 00 00       	push   $0x1030
 1b8:	e8 03 02 00 00       	call   3c0 <find>
 1bd:	83 c4 20             	add    $0x20,%esp
    free(path);
    if(name != (void *)0) free(name);
    if(type != (void *)0) free(type);
    if(inum != (void *)0) free(inum);
  }
  exit();
 1c0:	e8 3e 09 00 00       	call   b03 <exit>
        name = malloc(DIRSIZ);
 1c5:	83 ec 0c             	sub    $0xc,%esp
 1c8:	6a 0e                	push   $0xe
 1ca:	e8 f1 0c 00 00       	call   ec0 <malloc>
        if(i == argc - 1){
 1cf:	83 c4 10             	add    $0x10,%esp
        name = malloc(DIRSIZ);
 1d2:	89 45 e0             	mov    %eax,-0x20(%ebp)
        if(i == argc - 1){
 1d5:	39 5d cc             	cmp    %ebx,-0x34(%ebp)
 1d8:	0f 85 bb 00 00 00    	jne    299 <main+0x299>
          printf(2, "find: no name entered\n");
 1de:	50                   	push   %eax
 1df:	50                   	push   %eax
 1e0:	68 4c 10 00 00       	push   $0x104c
 1e5:	6a 02                	push   $0x2
 1e7:	e8 74 0a 00 00       	call   c60 <printf>
          exit();
 1ec:	e8 12 09 00 00       	call   b03 <exit>
        type = malloc(DIRSIZ);
 1f1:	83 ec 0c             	sub    $0xc,%esp
 1f4:	6a 0e                	push   $0xe
 1f6:	e8 c5 0c 00 00       	call   ec0 <malloc>
        if(i == argc - 1){
 1fb:	83 c4 10             	add    $0x10,%esp
        type = malloc(DIRSIZ);
 1fe:	89 45 d8             	mov    %eax,-0x28(%ebp)
        if(i == argc - 1){
 201:	39 5d cc             	cmp    %ebx,-0x34(%ebp)
 204:	0f 84 5a 01 00 00    	je     364 <main+0x364>
        else if(strcmp(argv[i+1], "f") != 0 && strcmp(argv[i+1], "d") != 0){
 20a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 20d:	8d 74 38 04          	lea    0x4(%eax,%edi,1),%esi
 211:	50                   	push   %eax
 212:	50                   	push   %eax
 213:	68 12 10 00 00       	push   $0x1012
 218:	ff 36                	push   (%esi)
 21a:	e8 b1 06 00 00       	call   8d0 <strcmp>
 21f:	83 c4 10             	add    $0x10,%esp
 222:	85 c0                	test   %eax,%eax
 224:	74 28                	je     24e <main+0x24e>
 226:	57                   	push   %edi
 227:	57                   	push   %edi
 228:	68 18 10 00 00       	push   $0x1018
 22d:	ff 36                	push   (%esi)
 22f:	e8 9c 06 00 00       	call   8d0 <strcmp>
 234:	83 c4 10             	add    $0x10,%esp
 237:	85 c0                	test   %eax,%eax
 239:	74 13                	je     24e <main+0x24e>
          printf(2, "find: incorrect type provided\n");
 23b:	51                   	push   %ecx
 23c:	51                   	push   %ecx
 23d:	68 dc 10 00 00       	push   $0x10dc
 242:	6a 02                	push   $0x2
 244:	e8 17 0a 00 00       	call   c60 <printf>
          exit();
 249:	e8 b5 08 00 00       	call   b03 <exit>
        memmove(type, argv[i+1], strlen(argv[i+1]));
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	ff 36                	push   (%esi)
        i++;
 253:	83 c3 01             	add    $0x1,%ebx
        memmove(type, argv[i+1], strlen(argv[i+1]));
 256:	e8 c5 06 00 00       	call   920 <strlen>
 25b:	83 c4 0c             	add    $0xc,%esp
 25e:	50                   	push   %eax
 25f:	ff 36                	push   (%esi)
 261:	ff 75 d8             	push   -0x28(%ebp)
 264:	e8 67 08 00 00       	call   ad0 <memmove>
        continue;
 269:	83 c4 10             	add    $0x10,%esp
 26c:	e9 7e fe ff ff       	jmp    ef <main+0xef>
        inum = malloc(DIRSIZ);
 271:	83 ec 0c             	sub    $0xc,%esp
 274:	6a 0e                	push   $0xe
 276:	e8 45 0c 00 00       	call   ec0 <malloc>
        if(i == argc - 1){
 27b:	83 c4 10             	add    $0x10,%esp
        inum = malloc(DIRSIZ);
 27e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(i == argc - 1){
 281:	39 5d cc             	cmp    %ebx,-0x34(%ebp)
 284:	75 3d                	jne    2c3 <main+0x2c3>
          printf(2, "find: no inum entered\n");
 286:	52                   	push   %edx
 287:	52                   	push   %edx
 288:	68 7a 10 00 00       	push   $0x107a
 28d:	6a 02                	push   $0x2
 28f:	e8 cc 09 00 00       	call   c60 <printf>
          exit();
 294:	e8 6a 08 00 00       	call   b03 <exit>
        memmove(name, argv[i+1], strlen(argv[i+1]));
 299:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 29c:	83 ec 0c             	sub    $0xc,%esp
        i++;
 29f:	83 c3 01             	add    $0x1,%ebx
        memmove(name, argv[i+1], strlen(argv[i+1]));
 2a2:	8d 74 38 04          	lea    0x4(%eax,%edi,1),%esi
 2a6:	ff 36                	push   (%esi)
 2a8:	e8 73 06 00 00       	call   920 <strlen>
 2ad:	83 c4 0c             	add    $0xc,%esp
 2b0:	50                   	push   %eax
 2b1:	ff 36                	push   (%esi)
 2b3:	ff 75 e0             	push   -0x20(%ebp)
 2b6:	e8 15 08 00 00       	call   ad0 <memmove>
        continue;
 2bb:	83 c4 10             	add    $0x10,%esp
 2be:	e9 2c fe ff ff       	jmp    ef <main+0xef>
        memmove(inum, argv[i+1], strlen(argv[i+1]));
 2c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2c6:	83 ec 0c             	sub    $0xc,%esp
        i++;
 2c9:	83 c3 01             	add    $0x1,%ebx
        memmove(inum, argv[i+1], strlen(argv[i+1]));
 2cc:	8d 74 38 04          	lea    0x4(%eax,%edi,1),%esi
 2d0:	ff 36                	push   (%esi)
 2d2:	e8 49 06 00 00       	call   920 <strlen>
 2d7:	83 c4 0c             	add    $0xc,%esp
 2da:	50                   	push   %eax
 2db:	ff 36                	push   (%esi)
 2dd:	ff 75 d4             	push   -0x2c(%ebp)
 2e0:	e8 eb 07 00 00       	call   ad0 <memmove>
        continue;
 2e5:	83 c4 10             	add    $0x10,%esp
 2e8:	e9 02 fe ff ff       	jmp    ef <main+0xef>
    find(path, name, type, inum, printi);
 2ed:	8b 5d c8             	mov    -0x38(%ebp),%ebx
 2f0:	8b 7d e0             	mov    -0x20(%ebp),%edi
 2f3:	83 ec 0c             	sub    $0xc,%esp
 2f6:	ff 75 d0             	push   -0x30(%ebp)
 2f9:	ff 75 d4             	push   -0x2c(%ebp)
 2fc:	ff 75 d8             	push   -0x28(%ebp)
 2ff:	57                   	push   %edi
 300:	53                   	push   %ebx
 301:	e8 ba 00 00 00       	call   3c0 <find>
    free(path);
 306:	83 c4 14             	add    $0x14,%esp
 309:	53                   	push   %ebx
 30a:	e8 21 0b 00 00       	call   e30 <free>
    if(name != (void *)0) free(name);
 30f:	83 c4 10             	add    $0x10,%esp
 312:	85 ff                	test   %edi,%edi
 314:	74 0c                	je     322 <main+0x322>
 316:	83 ec 0c             	sub    $0xc,%esp
 319:	57                   	push   %edi
 31a:	e8 11 0b 00 00       	call   e30 <free>
 31f:	83 c4 10             	add    $0x10,%esp
    if(type != (void *)0) free(type);
 322:	8b 45 d8             	mov    -0x28(%ebp),%eax
 325:	85 c0                	test   %eax,%eax
 327:	74 0c                	je     335 <main+0x335>
 329:	83 ec 0c             	sub    $0xc,%esp
 32c:	50                   	push   %eax
 32d:	e8 fe 0a 00 00       	call   e30 <free>
 332:	83 c4 10             	add    $0x10,%esp
    if(inum != (void *)0) free(inum);
 335:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 338:	85 c0                	test   %eax,%eax
 33a:	0f 84 80 fe ff ff    	je     1c0 <main+0x1c0>
 340:	83 ec 0c             	sub    $0xc,%esp
 343:	50                   	push   %eax
 344:	e8 e7 0a 00 00       	call   e30 <free>
 349:	83 c4 10             	add    $0x10,%esp
 34c:	e9 6f fe ff ff       	jmp    1c0 <main+0x1c0>
        printf(2, "find: incorrect flag entered\n");
 351:	50                   	push   %eax
 352:	50                   	push   %eax
 353:	68 91 10 00 00       	push   $0x1091
 358:	6a 02                	push   $0x2
 35a:	e8 01 09 00 00       	call   c60 <printf>
        exit();
 35f:	e8 9f 07 00 00       	call   b03 <exit>
          printf(2, "find: no type entered\n");
 364:	50                   	push   %eax
 365:	50                   	push   %eax
 366:	68 63 10 00 00       	push   $0x1063
 36b:	6a 02                	push   $0x2
 36d:	e8 ee 08 00 00       	call   c60 <printf>
          exit();
 372:	e8 8c 07 00 00       	call   b03 <exit>
 377:	66 90                	xchg   %ax,%ax
 379:	66 90                	xchg   %ax,%ax
 37b:	66 90                	xchg   %ax,%ax
 37d:	66 90                	xchg   %ax,%ax
 37f:	90                   	nop

00000380 <fmtname>:
{
 380:	f3 0f 1e fb          	endbr32
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	53                   	push   %ebx
 388:	83 ec 10             	sub    $0x10,%esp
 38b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
 38e:	53                   	push   %ebx
 38f:	e8 8c 05 00 00       	call   920 <strlen>
 394:	83 c4 10             	add    $0x10,%esp
 397:	01 d8                	add    %ebx,%eax
 399:	73 0e                	jae    3a9 <fmtname+0x29>
 39b:	eb 11                	jmp    3ae <fmtname+0x2e>
 39d:	8d 76 00             	lea    0x0(%esi),%esi
 3a0:	8d 50 ff             	lea    -0x1(%eax),%edx
 3a3:	39 d3                	cmp    %edx,%ebx
 3a5:	77 0a                	ja     3b1 <fmtname+0x31>
 3a7:	89 d0                	mov    %edx,%eax
 3a9:	80 38 2f             	cmpb   $0x2f,(%eax)
 3ac:	75 f2                	jne    3a0 <fmtname+0x20>
 3ae:	83 c0 01             	add    $0x1,%eax
}
 3b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b4:	c9                   	leave
 3b5:	c3                   	ret
 3b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3bd:	00 
 3be:	66 90                	xchg   %ax,%ax

000003c0 <find>:
{
 3c0:	f3 0f 1e fb          	endbr32
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	57                   	push   %edi
 3c8:	56                   	push   %esi
 3c9:	53                   	push   %ebx
 3ca:	83 ec 54             	sub    $0x54,%esp
  if((fd = open(path, 0)) < 0){
 3cd:	6a 00                	push   $0x0
 3cf:	ff 75 08             	push   0x8(%ebp)
 3d2:	e8 6c 07 00 00       	call   b43 <open>
 3d7:	83 c4 10             	add    $0x10,%esp
 3da:	85 c0                	test   %eax,%eax
 3dc:	0f 88 b6 02 00 00    	js     698 <find+0x2d8>
  if(fstat(fd, &st) < 0){
 3e2:	83 ec 08             	sub    $0x8,%esp
 3e5:	89 c6                	mov    %eax,%esi
 3e7:	8d 45 d4             	lea    -0x2c(%ebp),%eax
 3ea:	50                   	push   %eax
 3eb:	56                   	push   %esi
 3ec:	e8 6a 07 00 00       	call   b5b <fstat>
 3f1:	83 c4 10             	add    $0x10,%esp
 3f4:	85 c0                	test   %eax,%eax
 3f6:	0f 88 5c 03 00 00    	js     758 <find+0x398>
  if(inum != (void *)0){
 3fc:	8b 45 14             	mov    0x14(%ebp),%eax
 3ff:	85 c0                	test   %eax,%eax
 401:	0f 84 d1 01 00 00    	je     5d8 <find+0x218>
    char* temp = malloc(DIRSIZ);
 407:	83 ec 0c             	sub    $0xc,%esp
 40a:	6a 0e                	push   $0xe
 40c:	e8 af 0a 00 00       	call   ec0 <malloc>
    if(inum[0] == '+'){
 411:	83 c4 10             	add    $0x10,%esp
    char* temp = malloc(DIRSIZ);
 414:	89 c7                	mov    %eax,%edi
    if(inum[0] == '+'){
 416:	8b 45 14             	mov    0x14(%ebp),%eax
 419:	0f b6 00             	movzbl (%eax),%eax
 41c:	3c 2b                	cmp    $0x2b,%al
 41e:	0f 84 5c 03 00 00    	je     780 <find+0x3c0>
    else if(inum[0] == '-'){
 424:	3c 2d                	cmp    $0x2d,%al
 426:	0f 84 8c 02 00 00    	je     6b8 <find+0x2f8>
    else inodenum = atoi(inum);
 42c:	83 ec 0c             	sub    $0xc,%esp
 42f:	ff 75 14             	push   0x14(%ebp)
 432:	e8 59 06 00 00       	call   a90 <atoi>
    inumCompare = 0;
 437:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
    else inodenum = atoi(inum);
 43e:	83 c4 10             	add    $0x10,%esp
 441:	89 c3                	mov    %eax,%ebx
    if(inodenum == 0){
 443:	85 db                	test   %ebx,%ebx
 445:	0f 84 21 04 00 00    	je     86c <find+0x4ac>
    free(temp);
 44b:	83 ec 0c             	sub    $0xc,%esp
 44e:	57                   	push   %edi
 44f:	e8 dc 09 00 00       	call   e30 <free>
  switch(st.type){
 454:	0f b7 45 d4          	movzwl -0x2c(%ebp),%eax
    free(temp);
 458:	83 c4 10             	add    $0x10,%esp
  switch(st.type){
 45b:	66 83 f8 01          	cmp    $0x1,%ax
 45f:	0f 85 8d 01 00 00    	jne    5f2 <find+0x232>
    if((name == (void *)0 || strcmp(name, fmtname(path)) == 0)
 465:	8b 45 0c             	mov    0xc(%ebp),%eax
 468:	85 c0                	test   %eax,%eax
 46a:	74 1d                	je     489 <find+0xc9>
 46c:	83 ec 0c             	sub    $0xc,%esp
 46f:	ff 75 08             	push   0x8(%ebp)
 472:	e8 09 ff ff ff       	call   380 <fmtname>
 477:	5a                   	pop    %edx
 478:	59                   	pop    %ecx
 479:	50                   	push   %eax
 47a:	ff 75 0c             	push   0xc(%ebp)
 47d:	e8 4e 04 00 00       	call   8d0 <strcmp>
 482:	83 c4 10             	add    $0x10,%esp
 485:	85 c0                	test   %eax,%eax
 487:	75 27                	jne    4b0 <find+0xf0>
      && (type == (void *)0 || strcmp(type, "d") == 0)
 489:	8b 7d 10             	mov    0x10(%ebp),%edi
 48c:	85 ff                	test   %edi,%edi
 48e:	0f 84 5c 02 00 00    	je     6f0 <find+0x330>
 494:	83 ec 08             	sub    $0x8,%esp
 497:	68 18 10 00 00       	push   $0x1018
 49c:	ff 75 10             	push   0x10(%ebp)
 49f:	e8 2c 04 00 00       	call   8d0 <strcmp>
 4a4:	83 c4 10             	add    $0x10,%esp
 4a7:	85 c0                	test   %eax,%eax
 4a9:	0f 84 41 02 00 00    	je     6f0 <find+0x330>
 4af:	90                   	nop
    if(strlen(path) + 1 + DIRSIZ + 1 > 512){
 4b0:	83 ec 0c             	sub    $0xc,%esp
 4b3:	ff 75 08             	push   0x8(%ebp)
 4b6:	8d 7d c4             	lea    -0x3c(%ebp),%edi
      if(strcmp(de.name, ".") != 0 && strcmp(de.name, "..") != 0){
 4b9:	8d 5d c6             	lea    -0x3a(%ebp),%ebx
    if(strlen(path) + 1 + DIRSIZ + 1 > 512){
 4bc:	e8 5f 04 00 00       	call   920 <strlen>
 4c1:	83 c4 10             	add    $0x10,%esp
 4c4:	83 c0 10             	add    $0x10,%eax
 4c7:	3d 00 02 00 00       	cmp    $0x200,%eax
 4cc:	0f 87 0e 03 00 00    	ja     7e0 <find+0x420>
 4d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 4d8:	83 ec 04             	sub    $0x4,%esp
 4db:	6a 10                	push   $0x10
 4dd:	57                   	push   %edi
 4de:	56                   	push   %esi
 4df:	e8 37 06 00 00       	call   b1b <read>
 4e4:	83 c4 10             	add    $0x10,%esp
 4e7:	83 f8 10             	cmp    $0x10,%eax
 4ea:	0f 85 50 02 00 00    	jne    740 <find+0x380>
      if(de.inum == 0)
 4f0:	66 83 7d c4 00       	cmpw   $0x0,-0x3c(%ebp)
 4f5:	74 e1                	je     4d8 <find+0x118>
      if(strcmp(de.name, ".") != 0 && strcmp(de.name, "..") != 0){
 4f7:	83 ec 08             	sub    $0x8,%esp
 4fa:	68 30 10 00 00       	push   $0x1030
 4ff:	53                   	push   %ebx
 500:	e8 cb 03 00 00       	call   8d0 <strcmp>
 505:	83 c4 10             	add    $0x10,%esp
 508:	85 c0                	test   %eax,%eax
 50a:	74 cc                	je     4d8 <find+0x118>
 50c:	83 ec 08             	sub    $0x8,%esp
 50f:	68 2f 10 00 00       	push   $0x102f
 514:	53                   	push   %ebx
 515:	e8 b6 03 00 00       	call   8d0 <strcmp>
 51a:	83 c4 10             	add    $0x10,%esp
 51d:	85 c0                	test   %eax,%eax
 51f:	74 b7                	je     4d8 <find+0x118>
        char *newPath = malloc(strlen(path) + strlen(de.name) + 2);
 521:	83 ec 0c             	sub    $0xc,%esp
 524:	ff 75 08             	push   0x8(%ebp)
 527:	e8 f4 03 00 00       	call   920 <strlen>
 52c:	89 1c 24             	mov    %ebx,(%esp)
 52f:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 532:	e8 e9 03 00 00       	call   920 <strlen>
 537:	8b 55 b4             	mov    -0x4c(%ebp),%edx
 53a:	8d 44 02 02          	lea    0x2(%edx,%eax,1),%eax
 53e:	89 04 24             	mov    %eax,(%esp)
 541:	e8 7a 09 00 00       	call   ec0 <malloc>
        if (!newPath) {
 546:	83 c4 10             	add    $0x10,%esp
        char *newPath = malloc(strlen(path) + strlen(de.name) + 2);
 549:	89 45 b4             	mov    %eax,-0x4c(%ebp)
        if (!newPath) {
 54c:	85 c0                	test   %eax,%eax
 54e:	0f 84 2b 03 00 00    	je     87f <find+0x4bf>
        memmove(newPath, path, strlen(path));
 554:	83 ec 0c             	sub    $0xc,%esp
 557:	ff 75 08             	push   0x8(%ebp)
 55a:	e8 c1 03 00 00       	call   920 <strlen>
 55f:	83 c4 0c             	add    $0xc,%esp
 562:	50                   	push   %eax
 563:	ff 75 08             	push   0x8(%ebp)
 566:	ff 75 b4             	push   -0x4c(%ebp)
 569:	e8 62 05 00 00       	call   ad0 <memmove>
        newPath[strlen(path)] = '/';
 56e:	58                   	pop    %eax
 56f:	ff 75 08             	push   0x8(%ebp)
 572:	e8 a9 03 00 00       	call   920 <strlen>
 577:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
 57a:	c6 04 01 2f          	movb   $0x2f,(%ecx,%eax,1)
        memmove(newPath + strlen(path) + 1, de.name, strlen(de.name) + 1);
 57e:	89 1c 24             	mov    %ebx,(%esp)
 581:	e8 9a 03 00 00       	call   920 <strlen>
 586:	5a                   	pop    %edx
 587:	ff 75 08             	push   0x8(%ebp)
 58a:	89 45 b0             	mov    %eax,-0x50(%ebp)
 58d:	e8 8e 03 00 00       	call   920 <strlen>
 592:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
 595:	83 c4 0c             	add    $0xc,%esp
 598:	89 c2                	mov    %eax,%edx
 59a:	8b 45 b0             	mov    -0x50(%ebp),%eax
 59d:	83 c0 01             	add    $0x1,%eax
 5a0:	50                   	push   %eax
 5a1:	8d 44 11 01          	lea    0x1(%ecx,%edx,1),%eax
 5a5:	53                   	push   %ebx
 5a6:	50                   	push   %eax
 5a7:	e8 24 05 00 00       	call   ad0 <memmove>
        find(newPath, name, type, inum, printi);
 5ac:	59                   	pop    %ecx
 5ad:	ff 75 18             	push   0x18(%ebp)
 5b0:	ff 75 14             	push   0x14(%ebp)
 5b3:	ff 75 10             	push   0x10(%ebp)
 5b6:	ff 75 0c             	push   0xc(%ebp)
 5b9:	ff 75 b4             	push   -0x4c(%ebp)
 5bc:	e8 ff fd ff ff       	call   3c0 <find>
        free(newPath);
 5c1:	83 c4 14             	add    $0x14,%esp
 5c4:	ff 75 b4             	push   -0x4c(%ebp)
 5c7:	e8 64 08 00 00       	call   e30 <free>
 5cc:	83 c4 10             	add    $0x10,%esp
 5cf:	e9 04 ff ff ff       	jmp    4d8 <find+0x118>
 5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  switch(st.type){
 5d8:	0f b7 45 d4          	movzwl -0x2c(%ebp),%eax
  int inumCompare = -1;
 5dc:	c7 45 b4 ff ff ff ff 	movl   $0xffffffff,-0x4c(%ebp)
  int inodenum = -1;
 5e3:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  switch(st.type){
 5e8:	66 83 f8 01          	cmp    $0x1,%ax
 5ec:	0f 84 73 fe ff ff    	je     465 <find+0xa5>
 5f2:	66 83 f8 02          	cmp    $0x2,%ax
 5f6:	0f 85 84 00 00 00    	jne    680 <find+0x2c0>
    if((name == (void *)0 || strcmp(name, fmtname(path)) == 0)
 5fc:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ff:	85 c0                	test   %eax,%eax
 601:	74 1d                	je     620 <find+0x260>
 603:	83 ec 0c             	sub    $0xc,%esp
 606:	ff 75 08             	push   0x8(%ebp)
 609:	e8 72 fd ff ff       	call   380 <fmtname>
 60e:	5a                   	pop    %edx
 60f:	59                   	pop    %ecx
 610:	50                   	push   %eax
 611:	ff 75 0c             	push   0xc(%ebp)
 614:	e8 b7 02 00 00       	call   8d0 <strcmp>
 619:	83 c4 10             	add    $0x10,%esp
 61c:	85 c0                	test   %eax,%eax
 61e:	75 60                	jne    680 <find+0x2c0>
      && (type == (void *)0 || strcmp(type, "f") == 0)
 620:	8b 7d 10             	mov    0x10(%ebp),%edi
 623:	85 ff                	test   %edi,%edi
 625:	74 17                	je     63e <find+0x27e>
 627:	83 ec 08             	sub    $0x8,%esp
 62a:	68 12 10 00 00       	push   $0x1012
 62f:	ff 75 10             	push   0x10(%ebp)
 632:	e8 99 02 00 00       	call   8d0 <strcmp>
 637:	83 c4 10             	add    $0x10,%esp
 63a:	85 c0                	test   %eax,%eax
 63c:	75 42                	jne    680 <find+0x2c0>
      && (inum == (void *)0 || (inumCompare == 0 && st.ino == inodenum) || (inumCompare == 1 && st.ino > inodenum) || (inumCompare == 2 && st.ino < inodenum))){
 63e:	8b 45 14             	mov    0x14(%ebp),%eax
 641:	85 c0                	test   %eax,%eax
 643:	74 1b                	je     660 <find+0x2a0>
 645:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 648:	85 c0                	test   %eax,%eax
 64a:	0f 84 70 01 00 00    	je     7c0 <find+0x400>
 650:	83 7d b4 01          	cmpl   $0x1,-0x4c(%ebp)
 654:	0f 85 a6 01 00 00    	jne    800 <find+0x440>
 65a:	39 5d dc             	cmp    %ebx,-0x24(%ebp)
 65d:	76 21                	jbe    680 <find+0x2c0>
 65f:	90                   	nop
        if(printi == 1) printf(1, "%d ", st.ino);
 660:	83 7d 18 01          	cmpl   $0x1,0x18(%ebp)
 664:	0f 84 ce 01 00 00    	je     838 <find+0x478>
        printf(1, "%s\n", path);
 66a:	83 ec 04             	sub    $0x4,%esp
 66d:	ff 75 08             	push   0x8(%ebp)
 670:	68 da 0f 00 00       	push   $0xfda
 675:	6a 01                	push   $0x1
 677:	e8 e4 05 00 00       	call   c60 <printf>
 67c:	83 c4 10             	add    $0x10,%esp
 67f:	90                   	nop
  close(fd);
 680:	83 ec 0c             	sub    $0xc,%esp
 683:	56                   	push   %esi
 684:	e8 a2 04 00 00       	call   b2b <close>
 689:	83 c4 10             	add    $0x10,%esp
}
 68c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 68f:	5b                   	pop    %ebx
 690:	5e                   	pop    %esi
 691:	5f                   	pop    %edi
 692:	5d                   	pop    %ebp
 693:	c3                   	ret
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "find: cannot open %s\n", path);
 698:	83 ec 04             	sub    $0x4,%esp
 69b:	ff 75 08             	push   0x8(%ebp)
 69e:	68 c8 0f 00 00       	push   $0xfc8
 6a3:	6a 02                	push   $0x2
 6a5:	e8 b6 05 00 00       	call   c60 <printf>
    return;
 6aa:	83 c4 10             	add    $0x10,%esp
}
 6ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6b0:	5b                   	pop    %ebx
 6b1:	5e                   	pop    %esi
 6b2:	5f                   	pop    %edi
 6b3:	5d                   	pop    %ebp
 6b4:	c3                   	ret
 6b5:	8d 76 00             	lea    0x0(%esi),%esi
      memmove(temp, inum+1, strlen(inum)-1);
 6b8:	83 ec 0c             	sub    $0xc,%esp
 6bb:	ff 75 14             	push   0x14(%ebp)
 6be:	e8 5d 02 00 00       	call   920 <strlen>
 6c3:	83 c4 0c             	add    $0xc,%esp
 6c6:	83 e8 01             	sub    $0x1,%eax
 6c9:	50                   	push   %eax
 6ca:	8b 45 14             	mov    0x14(%ebp),%eax
 6cd:	83 c0 01             	add    $0x1,%eax
 6d0:	50                   	push   %eax
 6d1:	57                   	push   %edi
 6d2:	e8 f9 03 00 00       	call   ad0 <memmove>
      inodenum = atoi(temp);
 6d7:	89 3c 24             	mov    %edi,(%esp)
 6da:	e8 b1 03 00 00       	call   a90 <atoi>
      inumCompare = 2;
 6df:	c7 45 b4 02 00 00 00 	movl   $0x2,-0x4c(%ebp)
 6e6:	83 c4 10             	add    $0x10,%esp
      inodenum = atoi(temp);
 6e9:	89 c3                	mov    %eax,%ebx
 6eb:	e9 53 fd ff ff       	jmp    443 <find+0x83>
      && (inum == (void *)0 || (inumCompare == 0 && st.ino == inodenum) || (inumCompare == 1 && st.ino > inodenum) || (inumCompare == 2 && st.ino < inodenum))){
 6f0:	8b 45 14             	mov    0x14(%ebp),%eax
 6f3:	85 c0                	test   %eax,%eax
 6f5:	74 21                	je     718 <find+0x358>
 6f7:	8b 7d b4             	mov    -0x4c(%ebp),%edi
 6fa:	85 ff                	test   %edi,%edi
 6fc:	0f 84 ce 00 00 00    	je     7d0 <find+0x410>
 702:	83 7d b4 01          	cmpl   $0x1,-0x4c(%ebp)
 706:	0f 85 14 01 00 00    	jne    820 <find+0x460>
 70c:	39 5d dc             	cmp    %ebx,-0x24(%ebp)
 70f:	0f 86 9b fd ff ff    	jbe    4b0 <find+0xf0>
 715:	8d 76 00             	lea    0x0(%esi),%esi
        if(printi == 1) printf(1, "%d ", st.ino);
 718:	83 7d 18 01          	cmpl   $0x1,0x18(%ebp)
 71c:	0f 84 30 01 00 00    	je     852 <find+0x492>
        printf(1, "%s\n", path);
 722:	83 ec 04             	sub    $0x4,%esp
 725:	ff 75 08             	push   0x8(%ebp)
 728:	68 da 0f 00 00       	push   $0xfda
 72d:	6a 01                	push   $0x1
 72f:	e8 2c 05 00 00       	call   c60 <printf>
 734:	83 c4 10             	add    $0x10,%esp
 737:	e9 74 fd ff ff       	jmp    4b0 <find+0xf0>
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    close(fd);
 740:	83 ec 0c             	sub    $0xc,%esp
 743:	56                   	push   %esi
 744:	e8 e2 03 00 00       	call   b2b <close>
    break;
 749:	83 c4 10             	add    $0x10,%esp
 74c:	e9 2f ff ff ff       	jmp    680 <find+0x2c0>
 751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "find: cannot stat %s\n", path);
 758:	83 ec 04             	sub    $0x4,%esp
 75b:	ff 75 08             	push   0x8(%ebp)
 75e:	68 de 0f 00 00       	push   $0xfde
 763:	6a 02                	push   $0x2
 765:	e8 f6 04 00 00       	call   c60 <printf>
    close(fd);
 76a:	89 34 24             	mov    %esi,(%esp)
 76d:	e8 b9 03 00 00       	call   b2b <close>
    return;
 772:	83 c4 10             	add    $0x10,%esp
}
 775:	8d 65 f4             	lea    -0xc(%ebp),%esp
 778:	5b                   	pop    %ebx
 779:	5e                   	pop    %esi
 77a:	5f                   	pop    %edi
 77b:	5d                   	pop    %ebp
 77c:	c3                   	ret
 77d:	8d 76 00             	lea    0x0(%esi),%esi
      memmove(temp, inum+1, strlen(inum)-1);
 780:	83 ec 0c             	sub    $0xc,%esp
 783:	ff 75 14             	push   0x14(%ebp)
 786:	e8 95 01 00 00       	call   920 <strlen>
 78b:	83 c4 0c             	add    $0xc,%esp
 78e:	83 e8 01             	sub    $0x1,%eax
 791:	50                   	push   %eax
 792:	8b 45 14             	mov    0x14(%ebp),%eax
 795:	83 c0 01             	add    $0x1,%eax
 798:	50                   	push   %eax
 799:	57                   	push   %edi
 79a:	e8 31 03 00 00       	call   ad0 <memmove>
      inodenum = atoi(temp);
 79f:	89 3c 24             	mov    %edi,(%esp)
 7a2:	e8 e9 02 00 00       	call   a90 <atoi>
      inumCompare = 1;
 7a7:	c7 45 b4 01 00 00 00 	movl   $0x1,-0x4c(%ebp)
 7ae:	83 c4 10             	add    $0x10,%esp
      inodenum = atoi(temp);
 7b1:	89 c3                	mov    %eax,%ebx
 7b3:	e9 8b fc ff ff       	jmp    443 <find+0x83>
 7b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7bf:	00 
      && (inum == (void *)0 || (inumCompare == 0 && st.ino == inodenum) || (inumCompare == 1 && st.ino > inodenum) || (inumCompare == 2 && st.ino < inodenum))){
 7c0:	39 5d dc             	cmp    %ebx,-0x24(%ebp)
 7c3:	0f 85 b7 fe ff ff    	jne    680 <find+0x2c0>
 7c9:	e9 92 fe ff ff       	jmp    660 <find+0x2a0>
 7ce:	66 90                	xchg   %ax,%ax
      && (inum == (void *)0 || (inumCompare == 0 && st.ino == inodenum) || (inumCompare == 1 && st.ino > inodenum) || (inumCompare == 2 && st.ino < inodenum))){
 7d0:	39 5d dc             	cmp    %ebx,-0x24(%ebp)
 7d3:	0f 85 d7 fc ff ff    	jne    4b0 <find+0xf0>
 7d9:	e9 3a ff ff ff       	jmp    718 <find+0x358>
 7de:	66 90                	xchg   %ax,%ax
      printf(1, "find: path too long\n");
 7e0:	83 ec 08             	sub    $0x8,%esp
 7e3:	68 1a 10 00 00       	push   $0x101a
 7e8:	6a 01                	push   $0x1
 7ea:	e8 71 04 00 00       	call   c60 <printf>
      close(fd);
 7ef:	89 34 24             	mov    %esi,(%esp)
 7f2:	e8 34 03 00 00       	call   b2b <close>
      return;
 7f7:	83 c4 10             	add    $0x10,%esp
 7fa:	e9 8d fe ff ff       	jmp    68c <find+0x2cc>
 7ff:	90                   	nop
      && (inum == (void *)0 || (inumCompare == 0 && st.ino == inodenum) || (inumCompare == 1 && st.ino > inodenum) || (inumCompare == 2 && st.ino < inodenum))){
 800:	83 7d b4 02          	cmpl   $0x2,-0x4c(%ebp)
 804:	0f 85 76 fe ff ff    	jne    680 <find+0x2c0>
 80a:	39 5d dc             	cmp    %ebx,-0x24(%ebp)
 80d:	0f 83 6d fe ff ff    	jae    680 <find+0x2c0>
 813:	e9 48 fe ff ff       	jmp    660 <find+0x2a0>
 818:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 81f:	00 
      && (inum == (void *)0 || (inumCompare == 0 && st.ino == inodenum) || (inumCompare == 1 && st.ino > inodenum) || (inumCompare == 2 && st.ino < inodenum))){
 820:	83 7d b4 02          	cmpl   $0x2,-0x4c(%ebp)
 824:	0f 85 86 fc ff ff    	jne    4b0 <find+0xf0>
 82a:	39 5d dc             	cmp    %ebx,-0x24(%ebp)
 82d:	0f 83 7d fc ff ff    	jae    4b0 <find+0xf0>
 833:	e9 e0 fe ff ff       	jmp    718 <find+0x358>
        if(printi == 1) printf(1, "%d ", st.ino);
 838:	83 ec 04             	sub    $0x4,%esp
 83b:	ff 75 dc             	push   -0x24(%ebp)
 83e:	68 14 10 00 00       	push   $0x1014
 843:	6a 01                	push   $0x1
 845:	e8 16 04 00 00       	call   c60 <printf>
 84a:	83 c4 10             	add    $0x10,%esp
 84d:	e9 18 fe ff ff       	jmp    66a <find+0x2aa>
        if(printi == 1) printf(1, "%d ", st.ino);
 852:	83 ec 04             	sub    $0x4,%esp
 855:	ff 75 dc             	push   -0x24(%ebp)
 858:	68 14 10 00 00       	push   $0x1014
 85d:	6a 01                	push   $0x1
 85f:	e8 fc 03 00 00       	call   c60 <printf>
 864:	83 c4 10             	add    $0x10,%esp
 867:	e9 b6 fe ff ff       	jmp    722 <find+0x362>
      printf(2, "find: incorrect inum entered\n");
 86c:	50                   	push   %eax
 86d:	50                   	push   %eax
 86e:	68 f4 0f 00 00       	push   $0xff4
 873:	6a 02                	push   $0x2
 875:	e8 e6 03 00 00       	call   c60 <printf>
      exit();
 87a:	e8 84 02 00 00       	call   b03 <exit>
            printf(2, "find: failed to allocate memory\n");
 87f:	53                   	push   %ebx
 880:	53                   	push   %ebx
 881:	68 b8 10 00 00       	push   $0x10b8
 886:	6a 02                	push   $0x2
 888:	e8 d3 03 00 00       	call   c60 <printf>
            close(fd);
 88d:	89 34 24             	mov    %esi,(%esp)
 890:	e8 96 02 00 00       	call   b2b <close>
            exit();
 895:	e8 69 02 00 00       	call   b03 <exit>
 89a:	66 90                	xchg   %ax,%ax
 89c:	66 90                	xchg   %ax,%ax
 89e:	66 90                	xchg   %ax,%ax

000008a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 8a0:	f3 0f 1e fb          	endbr32
 8a4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 8a5:	31 c0                	xor    %eax,%eax
{
 8a7:	89 e5                	mov    %esp,%ebp
 8a9:	53                   	push   %ebx
 8aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8ad:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 8b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 8b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 8b7:	83 c0 01             	add    $0x1,%eax
 8ba:	84 d2                	test   %dl,%dl
 8bc:	75 f2                	jne    8b0 <strcpy+0x10>
    ;
  return os;
}
 8be:	89 c8                	mov    %ecx,%eax
 8c0:	5b                   	pop    %ebx
 8c1:	5d                   	pop    %ebp
 8c2:	c3                   	ret
 8c3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 8ca:	00 
 8cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000008d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 8d0:	f3 0f 1e fb          	endbr32
 8d4:	55                   	push   %ebp
 8d5:	89 e5                	mov    %esp,%ebp
 8d7:	53                   	push   %ebx
 8d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8db:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 8de:	0f b6 01             	movzbl (%ecx),%eax
 8e1:	0f b6 1a             	movzbl (%edx),%ebx
 8e4:	84 c0                	test   %al,%al
 8e6:	75 19                	jne    901 <strcmp+0x31>
 8e8:	eb 26                	jmp    910 <strcmp+0x40>
 8ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8f0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 8f4:	83 c1 01             	add    $0x1,%ecx
 8f7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 8fa:	0f b6 1a             	movzbl (%edx),%ebx
 8fd:	84 c0                	test   %al,%al
 8ff:	74 0f                	je     910 <strcmp+0x40>
 901:	38 d8                	cmp    %bl,%al
 903:	74 eb                	je     8f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 905:	29 d8                	sub    %ebx,%eax
}
 907:	5b                   	pop    %ebx
 908:	5d                   	pop    %ebp
 909:	c3                   	ret
 90a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 910:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 912:	29 d8                	sub    %ebx,%eax
}
 914:	5b                   	pop    %ebx
 915:	5d                   	pop    %ebp
 916:	c3                   	ret
 917:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 91e:	00 
 91f:	90                   	nop

00000920 <strlen>:

uint
strlen(const char *s)
{
 920:	f3 0f 1e fb          	endbr32
 924:	55                   	push   %ebp
 925:	89 e5                	mov    %esp,%ebp
 927:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 92a:	80 3a 00             	cmpb   $0x0,(%edx)
 92d:	74 21                	je     950 <strlen+0x30>
 92f:	31 c0                	xor    %eax,%eax
 931:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 938:	83 c0 01             	add    $0x1,%eax
 93b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 93f:	89 c1                	mov    %eax,%ecx
 941:	75 f5                	jne    938 <strlen+0x18>
    ;
  return n;
}
 943:	89 c8                	mov    %ecx,%eax
 945:	5d                   	pop    %ebp
 946:	c3                   	ret
 947:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 94e:	00 
 94f:	90                   	nop
  for(n = 0; s[n]; n++)
 950:	31 c9                	xor    %ecx,%ecx
}
 952:	5d                   	pop    %ebp
 953:	89 c8                	mov    %ecx,%eax
 955:	c3                   	ret
 956:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 95d:	00 
 95e:	66 90                	xchg   %ax,%ax

00000960 <memset>:

void*
memset(void *dst, int c, uint n)
{
 960:	f3 0f 1e fb          	endbr32
 964:	55                   	push   %ebp
 965:	89 e5                	mov    %esp,%ebp
 967:	57                   	push   %edi
 968:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 96b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 96e:	8b 45 0c             	mov    0xc(%ebp),%eax
 971:	89 d7                	mov    %edx,%edi
 973:	fc                   	cld
 974:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 976:	89 d0                	mov    %edx,%eax
 978:	5f                   	pop    %edi
 979:	5d                   	pop    %ebp
 97a:	c3                   	ret
 97b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000980 <strchr>:

char*
strchr(const char *s, char c)
{
 980:	f3 0f 1e fb          	endbr32
 984:	55                   	push   %ebp
 985:	89 e5                	mov    %esp,%ebp
 987:	8b 45 08             	mov    0x8(%ebp),%eax
 98a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 98e:	0f b6 10             	movzbl (%eax),%edx
 991:	84 d2                	test   %dl,%dl
 993:	75 16                	jne    9ab <strchr+0x2b>
 995:	eb 21                	jmp    9b8 <strchr+0x38>
 997:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 99e:	00 
 99f:	90                   	nop
 9a0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 9a4:	83 c0 01             	add    $0x1,%eax
 9a7:	84 d2                	test   %dl,%dl
 9a9:	74 0d                	je     9b8 <strchr+0x38>
    if(*s == c)
 9ab:	38 d1                	cmp    %dl,%cl
 9ad:	75 f1                	jne    9a0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 9af:	5d                   	pop    %ebp
 9b0:	c3                   	ret
 9b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 9b8:	31 c0                	xor    %eax,%eax
}
 9ba:	5d                   	pop    %ebp
 9bb:	c3                   	ret
 9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009c0 <gets>:

char*
gets(char *buf, int max)
{
 9c0:	f3 0f 1e fb          	endbr32
 9c4:	55                   	push   %ebp
 9c5:	89 e5                	mov    %esp,%ebp
 9c7:	57                   	push   %edi
 9c8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 9c9:	31 f6                	xor    %esi,%esi
{
 9cb:	53                   	push   %ebx
 9cc:	89 f3                	mov    %esi,%ebx
 9ce:	83 ec 1c             	sub    $0x1c,%esp
 9d1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 9d4:	eb 33                	jmp    a09 <gets+0x49>
 9d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 9dd:	00 
 9de:	66 90                	xchg   %ax,%ax
    cc = read(0, &c, 1);
 9e0:	83 ec 04             	sub    $0x4,%esp
 9e3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 9e6:	6a 01                	push   $0x1
 9e8:	50                   	push   %eax
 9e9:	6a 00                	push   $0x0
 9eb:	e8 2b 01 00 00       	call   b1b <read>
    if(cc < 1)
 9f0:	83 c4 10             	add    $0x10,%esp
 9f3:	85 c0                	test   %eax,%eax
 9f5:	7e 1c                	jle    a13 <gets+0x53>
      break;
    buf[i++] = c;
 9f7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 9fb:	83 c7 01             	add    $0x1,%edi
 9fe:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 a01:	3c 0a                	cmp    $0xa,%al
 a03:	74 23                	je     a28 <gets+0x68>
 a05:	3c 0d                	cmp    $0xd,%al
 a07:	74 1f                	je     a28 <gets+0x68>
  for(i=0; i+1 < max; ){
 a09:	83 c3 01             	add    $0x1,%ebx
 a0c:	89 fe                	mov    %edi,%esi
 a0e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 a11:	7c cd                	jl     9e0 <gets+0x20>
 a13:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 a15:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 a18:	c6 03 00             	movb   $0x0,(%ebx)
}
 a1b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a1e:	5b                   	pop    %ebx
 a1f:	5e                   	pop    %esi
 a20:	5f                   	pop    %edi
 a21:	5d                   	pop    %ebp
 a22:	c3                   	ret
 a23:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 a28:	8b 75 08             	mov    0x8(%ebp),%esi
 a2b:	8b 45 08             	mov    0x8(%ebp),%eax
 a2e:	01 de                	add    %ebx,%esi
 a30:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 a32:	c6 03 00             	movb   $0x0,(%ebx)
}
 a35:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a38:	5b                   	pop    %ebx
 a39:	5e                   	pop    %esi
 a3a:	5f                   	pop    %edi
 a3b:	5d                   	pop    %ebp
 a3c:	c3                   	ret
 a3d:	8d 76 00             	lea    0x0(%esi),%esi

00000a40 <stat>:

int
stat(const char *n, struct stat *st)
{
 a40:	f3 0f 1e fb          	endbr32
 a44:	55                   	push   %ebp
 a45:	89 e5                	mov    %esp,%ebp
 a47:	56                   	push   %esi
 a48:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 a49:	83 ec 08             	sub    $0x8,%esp
 a4c:	6a 00                	push   $0x0
 a4e:	ff 75 08             	push   0x8(%ebp)
 a51:	e8 ed 00 00 00       	call   b43 <open>
  if(fd < 0)
 a56:	83 c4 10             	add    $0x10,%esp
 a59:	85 c0                	test   %eax,%eax
 a5b:	78 2b                	js     a88 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 a5d:	83 ec 08             	sub    $0x8,%esp
 a60:	ff 75 0c             	push   0xc(%ebp)
 a63:	89 c3                	mov    %eax,%ebx
 a65:	50                   	push   %eax
 a66:	e8 f0 00 00 00       	call   b5b <fstat>
  close(fd);
 a6b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 a6e:	89 c6                	mov    %eax,%esi
  close(fd);
 a70:	e8 b6 00 00 00       	call   b2b <close>
  return r;
 a75:	83 c4 10             	add    $0x10,%esp
}
 a78:	8d 65 f8             	lea    -0x8(%ebp),%esp
 a7b:	89 f0                	mov    %esi,%eax
 a7d:	5b                   	pop    %ebx
 a7e:	5e                   	pop    %esi
 a7f:	5d                   	pop    %ebp
 a80:	c3                   	ret
 a81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 a88:	be ff ff ff ff       	mov    $0xffffffff,%esi
 a8d:	eb e9                	jmp    a78 <stat+0x38>
 a8f:	90                   	nop

00000a90 <atoi>:

int
atoi(const char *s)
{
 a90:	f3 0f 1e fb          	endbr32
 a94:	55                   	push   %ebp
 a95:	89 e5                	mov    %esp,%ebp
 a97:	53                   	push   %ebx
 a98:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 a9b:	0f be 02             	movsbl (%edx),%eax
 a9e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 aa1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 aa4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 aa9:	77 1a                	ja     ac5 <atoi+0x35>
 aab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 ab0:	83 c2 01             	add    $0x1,%edx
 ab3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 ab6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 aba:	0f be 02             	movsbl (%edx),%eax
 abd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 ac0:	80 fb 09             	cmp    $0x9,%bl
 ac3:	76 eb                	jbe    ab0 <atoi+0x20>
  return n;
}
 ac5:	89 c8                	mov    %ecx,%eax
 ac7:	5b                   	pop    %ebx
 ac8:	5d                   	pop    %ebp
 ac9:	c3                   	ret
 aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ad0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 ad0:	f3 0f 1e fb          	endbr32
 ad4:	55                   	push   %ebp
 ad5:	89 e5                	mov    %esp,%ebp
 ad7:	57                   	push   %edi
 ad8:	8b 45 10             	mov    0x10(%ebp),%eax
 adb:	8b 55 08             	mov    0x8(%ebp),%edx
 ade:	56                   	push   %esi
 adf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 ae2:	85 c0                	test   %eax,%eax
 ae4:	7e 0f                	jle    af5 <memmove+0x25>
 ae6:	01 d0                	add    %edx,%eax
  dst = vdst;
 ae8:	89 d7                	mov    %edx,%edi
 aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 af0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 af1:	39 f8                	cmp    %edi,%eax
 af3:	75 fb                	jne    af0 <memmove+0x20>
  return vdst;
}
 af5:	5e                   	pop    %esi
 af6:	89 d0                	mov    %edx,%eax
 af8:	5f                   	pop    %edi
 af9:	5d                   	pop    %ebp
 afa:	c3                   	ret

00000afb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 afb:	b8 01 00 00 00       	mov    $0x1,%eax
 b00:	cd 40                	int    $0x40
 b02:	c3                   	ret

00000b03 <exit>:
SYSCALL(exit)
 b03:	b8 02 00 00 00       	mov    $0x2,%eax
 b08:	cd 40                	int    $0x40
 b0a:	c3                   	ret

00000b0b <wait>:
SYSCALL(wait)
 b0b:	b8 03 00 00 00       	mov    $0x3,%eax
 b10:	cd 40                	int    $0x40
 b12:	c3                   	ret

00000b13 <pipe>:
SYSCALL(pipe)
 b13:	b8 04 00 00 00       	mov    $0x4,%eax
 b18:	cd 40                	int    $0x40
 b1a:	c3                   	ret

00000b1b <read>:
SYSCALL(read)
 b1b:	b8 05 00 00 00       	mov    $0x5,%eax
 b20:	cd 40                	int    $0x40
 b22:	c3                   	ret

00000b23 <write>:
SYSCALL(write)
 b23:	b8 10 00 00 00       	mov    $0x10,%eax
 b28:	cd 40                	int    $0x40
 b2a:	c3                   	ret

00000b2b <close>:
SYSCALL(close)
 b2b:	b8 15 00 00 00       	mov    $0x15,%eax
 b30:	cd 40                	int    $0x40
 b32:	c3                   	ret

00000b33 <kill>:
SYSCALL(kill)
 b33:	b8 06 00 00 00       	mov    $0x6,%eax
 b38:	cd 40                	int    $0x40
 b3a:	c3                   	ret

00000b3b <exec>:
SYSCALL(exec)
 b3b:	b8 07 00 00 00       	mov    $0x7,%eax
 b40:	cd 40                	int    $0x40
 b42:	c3                   	ret

00000b43 <open>:
SYSCALL(open)
 b43:	b8 0f 00 00 00       	mov    $0xf,%eax
 b48:	cd 40                	int    $0x40
 b4a:	c3                   	ret

00000b4b <mknod>:
SYSCALL(mknod)
 b4b:	b8 11 00 00 00       	mov    $0x11,%eax
 b50:	cd 40                	int    $0x40
 b52:	c3                   	ret

00000b53 <unlink>:
SYSCALL(unlink)
 b53:	b8 12 00 00 00       	mov    $0x12,%eax
 b58:	cd 40                	int    $0x40
 b5a:	c3                   	ret

00000b5b <fstat>:
SYSCALL(fstat)
 b5b:	b8 08 00 00 00       	mov    $0x8,%eax
 b60:	cd 40                	int    $0x40
 b62:	c3                   	ret

00000b63 <link>:
SYSCALL(link)
 b63:	b8 13 00 00 00       	mov    $0x13,%eax
 b68:	cd 40                	int    $0x40
 b6a:	c3                   	ret

00000b6b <mkdir>:
SYSCALL(mkdir)
 b6b:	b8 14 00 00 00       	mov    $0x14,%eax
 b70:	cd 40                	int    $0x40
 b72:	c3                   	ret

00000b73 <chdir>:
SYSCALL(chdir)
 b73:	b8 09 00 00 00       	mov    $0x9,%eax
 b78:	cd 40                	int    $0x40
 b7a:	c3                   	ret

00000b7b <dup>:
SYSCALL(dup)
 b7b:	b8 0a 00 00 00       	mov    $0xa,%eax
 b80:	cd 40                	int    $0x40
 b82:	c3                   	ret

00000b83 <getpid>:
SYSCALL(getpid)
 b83:	b8 0b 00 00 00       	mov    $0xb,%eax
 b88:	cd 40                	int    $0x40
 b8a:	c3                   	ret

00000b8b <sbrk>:
SYSCALL(sbrk)
 b8b:	b8 0c 00 00 00       	mov    $0xc,%eax
 b90:	cd 40                	int    $0x40
 b92:	c3                   	ret

00000b93 <sleep>:
SYSCALL(sleep)
 b93:	b8 0d 00 00 00       	mov    $0xd,%eax
 b98:	cd 40                	int    $0x40
 b9a:	c3                   	ret

00000b9b <uptime>:
SYSCALL(uptime)
 b9b:	b8 0e 00 00 00       	mov    $0xe,%eax
 ba0:	cd 40                	int    $0x40
 ba2:	c3                   	ret

00000ba3 <ticks_run>:
 ba3:	b8 16 00 00 00       	mov    $0x16,%eax
 ba8:	cd 40                	int    $0x40
 baa:	c3                   	ret
 bab:	66 90                	xchg   %ax,%ax
 bad:	66 90                	xchg   %ax,%ax
 baf:	90                   	nop

00000bb0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 bb0:	55                   	push   %ebp
 bb1:	89 e5                	mov    %esp,%ebp
 bb3:	57                   	push   %edi
 bb4:	56                   	push   %esi
 bb5:	53                   	push   %ebx
 bb6:	83 ec 3c             	sub    $0x3c,%esp
 bb9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 bbc:	89 d1                	mov    %edx,%ecx
{
 bbe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 bc1:	85 d2                	test   %edx,%edx
 bc3:	0f 89 7f 00 00 00    	jns    c48 <printint+0x98>
 bc9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 bcd:	74 79                	je     c48 <printint+0x98>
    neg = 1;
 bcf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 bd6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 bd8:	31 db                	xor    %ebx,%ebx
 bda:	8d 75 d7             	lea    -0x29(%ebp),%esi
 bdd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 be0:	89 c8                	mov    %ecx,%eax
 be2:	31 d2                	xor    %edx,%edx
 be4:	89 cf                	mov    %ecx,%edi
 be6:	f7 75 c4             	divl   -0x3c(%ebp)
 be9:	0f b6 92 fc 10 00 00 	movzbl 0x10fc(%edx),%edx
 bf0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 bf3:	89 d8                	mov    %ebx,%eax
 bf5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 bf8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 bfb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 bfe:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 c01:	76 dd                	jbe    be0 <printint+0x30>
  if(neg)
 c03:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 c06:	85 c9                	test   %ecx,%ecx
 c08:	74 0c                	je     c16 <printint+0x66>
    buf[i++] = '-';
 c0a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 c0f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 c11:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 c16:	8b 7d b8             	mov    -0x48(%ebp),%edi
 c19:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 c1d:	eb 07                	jmp    c26 <printint+0x76>
 c1f:	90                   	nop
 c20:	0f b6 13             	movzbl (%ebx),%edx
 c23:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 c26:	83 ec 04             	sub    $0x4,%esp
 c29:	88 55 d7             	mov    %dl,-0x29(%ebp)
 c2c:	6a 01                	push   $0x1
 c2e:	56                   	push   %esi
 c2f:	57                   	push   %edi
 c30:	e8 ee fe ff ff       	call   b23 <write>
  while(--i >= 0)
 c35:	83 c4 10             	add    $0x10,%esp
 c38:	39 de                	cmp    %ebx,%esi
 c3a:	75 e4                	jne    c20 <printint+0x70>
    putc(fd, buf[i]);
}
 c3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 c3f:	5b                   	pop    %ebx
 c40:	5e                   	pop    %esi
 c41:	5f                   	pop    %edi
 c42:	5d                   	pop    %ebp
 c43:	c3                   	ret
 c44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 c48:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 c4f:	eb 87                	jmp    bd8 <printint+0x28>
 c51:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 c58:	00 
 c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c60 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 c60:	f3 0f 1e fb          	endbr32
 c64:	55                   	push   %ebp
 c65:	89 e5                	mov    %esp,%ebp
 c67:	57                   	push   %edi
 c68:	56                   	push   %esi
 c69:	53                   	push   %ebx
 c6a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 c6d:	8b 75 0c             	mov    0xc(%ebp),%esi
 c70:	0f b6 1e             	movzbl (%esi),%ebx
 c73:	84 db                	test   %bl,%bl
 c75:	0f 84 b4 00 00 00    	je     d2f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 c7b:	8d 45 10             	lea    0x10(%ebp),%eax
 c7e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 c81:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 c84:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 c86:	89 45 d0             	mov    %eax,-0x30(%ebp)
 c89:	eb 33                	jmp    cbe <printf+0x5e>
 c8b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 c90:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 c93:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 c98:	83 f8 25             	cmp    $0x25,%eax
 c9b:	74 17                	je     cb4 <printf+0x54>
  write(fd, &c, 1);
 c9d:	83 ec 04             	sub    $0x4,%esp
 ca0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 ca3:	6a 01                	push   $0x1
 ca5:	57                   	push   %edi
 ca6:	ff 75 08             	push   0x8(%ebp)
 ca9:	e8 75 fe ff ff       	call   b23 <write>
 cae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 cb1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 cb4:	0f b6 1e             	movzbl (%esi),%ebx
 cb7:	83 c6 01             	add    $0x1,%esi
 cba:	84 db                	test   %bl,%bl
 cbc:	74 71                	je     d2f <printf+0xcf>
    c = fmt[i] & 0xff;
 cbe:	0f be cb             	movsbl %bl,%ecx
 cc1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 cc4:	85 d2                	test   %edx,%edx
 cc6:	74 c8                	je     c90 <printf+0x30>
      }
    } else if(state == '%'){
 cc8:	83 fa 25             	cmp    $0x25,%edx
 ccb:	75 e7                	jne    cb4 <printf+0x54>
      if(c == 'd'){
 ccd:	83 f8 64             	cmp    $0x64,%eax
 cd0:	0f 84 9a 00 00 00    	je     d70 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 cd6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 cdc:	83 f9 70             	cmp    $0x70,%ecx
 cdf:	74 5f                	je     d40 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 ce1:	83 f8 73             	cmp    $0x73,%eax
 ce4:	0f 84 d6 00 00 00    	je     dc0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 cea:	83 f8 63             	cmp    $0x63,%eax
 ced:	0f 84 8d 00 00 00    	je     d80 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 cf3:	83 f8 25             	cmp    $0x25,%eax
 cf6:	0f 84 b4 00 00 00    	je     db0 <printf+0x150>
  write(fd, &c, 1);
 cfc:	83 ec 04             	sub    $0x4,%esp
 cff:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 d03:	6a 01                	push   $0x1
 d05:	57                   	push   %edi
 d06:	ff 75 08             	push   0x8(%ebp)
 d09:	e8 15 fe ff ff       	call   b23 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 d0e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 d11:	83 c4 0c             	add    $0xc,%esp
 d14:	6a 01                	push   $0x1
 d16:	83 c6 01             	add    $0x1,%esi
 d19:	57                   	push   %edi
 d1a:	ff 75 08             	push   0x8(%ebp)
 d1d:	e8 01 fe ff ff       	call   b23 <write>
  for(i = 0; fmt[i]; i++){
 d22:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 d26:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 d29:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 d2b:	84 db                	test   %bl,%bl
 d2d:	75 8f                	jne    cbe <printf+0x5e>
    }
  }
}
 d2f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 d32:	5b                   	pop    %ebx
 d33:	5e                   	pop    %esi
 d34:	5f                   	pop    %edi
 d35:	5d                   	pop    %ebp
 d36:	c3                   	ret
 d37:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 d3e:	00 
 d3f:	90                   	nop
        printint(fd, *ap, 16, 0);
 d40:	83 ec 0c             	sub    $0xc,%esp
 d43:	b9 10 00 00 00       	mov    $0x10,%ecx
 d48:	6a 00                	push   $0x0
 d4a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 d4d:	8b 45 08             	mov    0x8(%ebp),%eax
 d50:	8b 13                	mov    (%ebx),%edx
 d52:	e8 59 fe ff ff       	call   bb0 <printint>
        ap++;
 d57:	89 d8                	mov    %ebx,%eax
 d59:	83 c4 10             	add    $0x10,%esp
      state = 0;
 d5c:	31 d2                	xor    %edx,%edx
        ap++;
 d5e:	83 c0 04             	add    $0x4,%eax
 d61:	89 45 d0             	mov    %eax,-0x30(%ebp)
 d64:	e9 4b ff ff ff       	jmp    cb4 <printf+0x54>
 d69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 d70:	83 ec 0c             	sub    $0xc,%esp
 d73:	b9 0a 00 00 00       	mov    $0xa,%ecx
 d78:	6a 01                	push   $0x1
 d7a:	eb ce                	jmp    d4a <printf+0xea>
 d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 d80:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 d83:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 d86:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 d88:	6a 01                	push   $0x1
        ap++;
 d8a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 d8d:	57                   	push   %edi
 d8e:	ff 75 08             	push   0x8(%ebp)
        putc(fd, *ap);
 d91:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 d94:	e8 8a fd ff ff       	call   b23 <write>
        ap++;
 d99:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 d9c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 d9f:	31 d2                	xor    %edx,%edx
 da1:	e9 0e ff ff ff       	jmp    cb4 <printf+0x54>
 da6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 dad:	00 
 dae:	66 90                	xchg   %ax,%ax
        putc(fd, c);
 db0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 db3:	83 ec 04             	sub    $0x4,%esp
 db6:	e9 59 ff ff ff       	jmp    d14 <printf+0xb4>
 dbb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 dc0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 dc3:	8b 18                	mov    (%eax),%ebx
        ap++;
 dc5:	83 c0 04             	add    $0x4,%eax
 dc8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 dcb:	85 db                	test   %ebx,%ebx
 dcd:	74 17                	je     de6 <printf+0x186>
        while(*s != 0){
 dcf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 dd2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 dd4:	84 c0                	test   %al,%al
 dd6:	0f 84 d8 fe ff ff    	je     cb4 <printf+0x54>
 ddc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 ddf:	89 de                	mov    %ebx,%esi
 de1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 de4:	eb 1a                	jmp    e00 <printf+0x1a0>
          s = "(null)";
 de6:	bb af 10 00 00       	mov    $0x10af,%ebx
        while(*s != 0){
 deb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 dee:	b8 28 00 00 00       	mov    $0x28,%eax
 df3:	89 de                	mov    %ebx,%esi
 df5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 df8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 dff:	00 
  write(fd, &c, 1);
 e00:	83 ec 04             	sub    $0x4,%esp
          s++;
 e03:	83 c6 01             	add    $0x1,%esi
 e06:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 e09:	6a 01                	push   $0x1
 e0b:	57                   	push   %edi
 e0c:	53                   	push   %ebx
 e0d:	e8 11 fd ff ff       	call   b23 <write>
        while(*s != 0){
 e12:	0f b6 06             	movzbl (%esi),%eax
 e15:	83 c4 10             	add    $0x10,%esp
 e18:	84 c0                	test   %al,%al
 e1a:	75 e4                	jne    e00 <printf+0x1a0>
 e1c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 e1f:	31 d2                	xor    %edx,%edx
 e21:	e9 8e fe ff ff       	jmp    cb4 <printf+0x54>
 e26:	66 90                	xchg   %ax,%ax
 e28:	66 90                	xchg   %ax,%ax
 e2a:	66 90                	xchg   %ax,%ax
 e2c:	66 90                	xchg   %ax,%ax
 e2e:	66 90                	xchg   %ax,%ax

00000e30 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 e30:	f3 0f 1e fb          	endbr32
 e34:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 e35:	a1 24 14 00 00       	mov    0x1424,%eax
{
 e3a:	89 e5                	mov    %esp,%ebp
 e3c:	57                   	push   %edi
 e3d:	56                   	push   %esi
 e3e:	53                   	push   %ebx
 e3f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 e42:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 e44:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 e47:	39 c8                	cmp    %ecx,%eax
 e49:	73 15                	jae    e60 <free+0x30>
 e4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 e50:	39 d1                	cmp    %edx,%ecx
 e52:	72 14                	jb     e68 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 e54:	39 d0                	cmp    %edx,%eax
 e56:	73 10                	jae    e68 <free+0x38>
{
 e58:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 e5a:	8b 10                	mov    (%eax),%edx
 e5c:	39 c8                	cmp    %ecx,%eax
 e5e:	72 f0                	jb     e50 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 e60:	39 d0                	cmp    %edx,%eax
 e62:	72 f4                	jb     e58 <free+0x28>
 e64:	39 d1                	cmp    %edx,%ecx
 e66:	73 f0                	jae    e58 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 e68:	8b 73 fc             	mov    -0x4(%ebx),%esi
 e6b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 e6e:	39 fa                	cmp    %edi,%edx
 e70:	74 1e                	je     e90 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 e72:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 e75:	8b 50 04             	mov    0x4(%eax),%edx
 e78:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 e7b:	39 f1                	cmp    %esi,%ecx
 e7d:	74 28                	je     ea7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 e7f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 e81:	5b                   	pop    %ebx
  freep = p;
 e82:	a3 24 14 00 00       	mov    %eax,0x1424
}
 e87:	5e                   	pop    %esi
 e88:	5f                   	pop    %edi
 e89:	5d                   	pop    %ebp
 e8a:	c3                   	ret
 e8b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 e90:	03 72 04             	add    0x4(%edx),%esi
 e93:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 e96:	8b 10                	mov    (%eax),%edx
 e98:	8b 12                	mov    (%edx),%edx
 e9a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 e9d:	8b 50 04             	mov    0x4(%eax),%edx
 ea0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 ea3:	39 f1                	cmp    %esi,%ecx
 ea5:	75 d8                	jne    e7f <free+0x4f>
    p->s.size += bp->s.size;
 ea7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 eaa:	a3 24 14 00 00       	mov    %eax,0x1424
    p->s.size += bp->s.size;
 eaf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 eb2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 eb5:	89 10                	mov    %edx,(%eax)
}
 eb7:	5b                   	pop    %ebx
 eb8:	5e                   	pop    %esi
 eb9:	5f                   	pop    %edi
 eba:	5d                   	pop    %ebp
 ebb:	c3                   	ret
 ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ec0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ec0:	f3 0f 1e fb          	endbr32
 ec4:	55                   	push   %ebp
 ec5:	89 e5                	mov    %esp,%ebp
 ec7:	57                   	push   %edi
 ec8:	56                   	push   %esi
 ec9:	53                   	push   %ebx
 eca:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ecd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 ed0:	8b 3d 24 14 00 00    	mov    0x1424,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ed6:	8d 70 07             	lea    0x7(%eax),%esi
 ed9:	c1 ee 03             	shr    $0x3,%esi
 edc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 edf:	85 ff                	test   %edi,%edi
 ee1:	0f 84 a9 00 00 00    	je     f90 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ee7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 ee9:	8b 48 04             	mov    0x4(%eax),%ecx
 eec:	39 f1                	cmp    %esi,%ecx
 eee:	73 6d                	jae    f5d <malloc+0x9d>
 ef0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 ef6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 efb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 efe:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 f05:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 f08:	eb 17                	jmp    f21 <malloc+0x61>
 f0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 f10:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 f12:	8b 4a 04             	mov    0x4(%edx),%ecx
 f15:	39 f1                	cmp    %esi,%ecx
 f17:	73 4f                	jae    f68 <malloc+0xa8>
 f19:	8b 3d 24 14 00 00    	mov    0x1424,%edi
 f1f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 f21:	39 c7                	cmp    %eax,%edi
 f23:	75 eb                	jne    f10 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 f25:	83 ec 0c             	sub    $0xc,%esp
 f28:	ff 75 e4             	push   -0x1c(%ebp)
 f2b:	e8 5b fc ff ff       	call   b8b <sbrk>
  if(p == (char*)-1)
 f30:	83 c4 10             	add    $0x10,%esp
 f33:	83 f8 ff             	cmp    $0xffffffff,%eax
 f36:	74 1b                	je     f53 <malloc+0x93>
  hp->s.size = nu;
 f38:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 f3b:	83 ec 0c             	sub    $0xc,%esp
 f3e:	83 c0 08             	add    $0x8,%eax
 f41:	50                   	push   %eax
 f42:	e8 e9 fe ff ff       	call   e30 <free>
  return freep;
 f47:	a1 24 14 00 00       	mov    0x1424,%eax
      if((p = morecore(nunits)) == 0)
 f4c:	83 c4 10             	add    $0x10,%esp
 f4f:	85 c0                	test   %eax,%eax
 f51:	75 bd                	jne    f10 <malloc+0x50>
        return 0;
  }
}
 f53:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 f56:	31 c0                	xor    %eax,%eax
}
 f58:	5b                   	pop    %ebx
 f59:	5e                   	pop    %esi
 f5a:	5f                   	pop    %edi
 f5b:	5d                   	pop    %ebp
 f5c:	c3                   	ret
    if(p->s.size >= nunits){
 f5d:	89 c2                	mov    %eax,%edx
 f5f:	89 f8                	mov    %edi,%eax
 f61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 f68:	39 ce                	cmp    %ecx,%esi
 f6a:	74 54                	je     fc0 <malloc+0x100>
        p->s.size -= nunits;
 f6c:	29 f1                	sub    %esi,%ecx
 f6e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 f71:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 f74:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 f77:	a3 24 14 00 00       	mov    %eax,0x1424
}
 f7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 f7f:	8d 42 08             	lea    0x8(%edx),%eax
}
 f82:	5b                   	pop    %ebx
 f83:	5e                   	pop    %esi
 f84:	5f                   	pop    %edi
 f85:	5d                   	pop    %ebp
 f86:	c3                   	ret
 f87:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 f8e:	00 
 f8f:	90                   	nop
    base.s.ptr = freep = prevp = &base;
 f90:	c7 05 24 14 00 00 28 	movl   $0x1428,0x1424
 f97:	14 00 00 
    base.s.size = 0;
 f9a:	bf 28 14 00 00       	mov    $0x1428,%edi
    base.s.ptr = freep = prevp = &base;
 f9f:	c7 05 28 14 00 00 28 	movl   $0x1428,0x1428
 fa6:	14 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 fa9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 fab:	c7 05 2c 14 00 00 00 	movl   $0x0,0x142c
 fb2:	00 00 00 
    if(p->s.size >= nunits){
 fb5:	e9 36 ff ff ff       	jmp    ef0 <malloc+0x30>
 fba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 fc0:	8b 0a                	mov    (%edx),%ecx
 fc2:	89 08                	mov    %ecx,(%eax)
 fc4:	eb b1                	jmp    f77 <malloc+0xb7>
