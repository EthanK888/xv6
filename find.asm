
_find:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    break;
  }
  close(fd);
}

int main(int argc, char *argv[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 28             	sub    $0x28,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  19:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  //If only find is entered, call find with no flags (null pointers) and . as directory
  if(argc < 2) find(".", (void *)0, (void *)0, (void *)0, 0);
  1f:	83 f8 01             	cmp    $0x1,%eax
  22:	0f 8e 80 01 00 00    	jle    1a8 <main+0x1a8>
  //If any other args are entered, allow them to appear in any order
  else{
    //Assign null pointers to flags if nothing is entered
    char *path = malloc(DIRSIZ);
  28:	83 ec 0c             	sub    $0xc,%esp
    char *name = (void *)0;
    char *type = (void *)0;
    char *inum = (void *)0;
    int printi = 0;

    for(int i = 1; i < argc; i++){
  2b:	bb 01 00 00 00       	mov    $0x1,%ebx
    char *path = malloc(DIRSIZ);
  30:	6a 0e                	push   $0xe
  32:	e8 b9 0e 00 00       	call   ef0 <malloc>
    int printi = 0;
  37:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    char *path = malloc(DIRSIZ);
  3e:	83 c4 10             	add    $0x10,%esp
  41:	89 45 c8             	mov    %eax,-0x38(%ebp)
      }
      //Check for inum flag
      else if(strcmp(argv[i], "-inum") == 0 && inum == (void *)0){
        inum = malloc(DIRSIZ);
        
        if(i == argc - 1){
  44:	8b 45 dc             	mov    -0x24(%ebp),%eax
    char *inum = (void *)0;
  47:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
        if(i == argc - 1){
  4e:	83 e8 01             	sub    $0x1,%eax
    char *type = (void *)0;
  51:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    char *name = (void *)0;
  58:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
        if(i == argc - 1){
  5f:	89 45 cc             	mov    %eax,-0x34(%ebp)
  62:	e9 94 00 00 00       	jmp    fb <main+0xfb>
  67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6e:	66 90                	xchg   %ax,%ax
      if(strcmp(argv[i], "-name") == 0 && name == (void *)0){
  70:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  73:	8d 3c 9d 00 00 00 00 	lea    0x0(,%ebx,4),%edi
  7a:	83 ec 08             	sub    $0x8,%esp
  7d:	68 52 10 00 00       	push   $0x1052
  82:	8d 34 38             	lea    (%eax,%edi,1),%esi
  85:	ff 36                	push   (%esi)
  87:	e8 b4 08 00 00       	call   940 <strcmp>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	0b 45 e0             	or     -0x20(%ebp),%eax
  92:	0f 84 2d 01 00 00    	je     1c5 <main+0x1c5>
      else if(strcmp(argv[i], "-type") == 0 && type == (void *)0){
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 58 10 00 00       	push   $0x1058
  a0:	ff 36                	push   (%esi)
  a2:	e8 99 08 00 00       	call   940 <strcmp>
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	0b 45 d8             	or     -0x28(%ebp),%eax
  ad:	0f 84 3e 01 00 00    	je     1f1 <main+0x1f1>
      else if(strcmp(argv[i], "-inum") == 0 && inum == (void *)0){
  b3:	83 ec 08             	sub    $0x8,%esp
  b6:	68 5e 10 00 00       	push   $0x105e
  bb:	ff 36                	push   (%esi)
  bd:	e8 7e 08 00 00       	call   940 <strcmp>
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
  d1:	68 64 10 00 00       	push   $0x1064
  d6:	ff 36                	push   (%esi)
  d8:	e8 63 08 00 00       	call   940 <strcmp>
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
 10a:	68 52 10 00 00       	push   $0x1052
 10f:	ff 70 04             	push   0x4(%eax)
 112:	e8 29 08 00 00       	call   940 <strcmp>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	85 c0                	test   %eax,%eax
 11c:	75 1a                	jne    138 <main+0x138>
      else if(i == 1) memmove(path, ".", 1);
 11e:	83 ec 04             	sub    $0x4,%esp
 121:	6a 01                	push   $0x1
 123:	68 50 10 00 00       	push   $0x1050
 128:	ff 75 c8             	push   -0x38(%ebp)
 12b:	e8 00 0a 00 00       	call   b30 <memmove>
 130:	83 c4 10             	add    $0x10,%esp
 133:	e9 38 ff ff ff       	jmp    70 <main+0x70>
      if(i == 1 && strcmp(argv[1], "-name") != 0 && strcmp(argv[1], "-type") != 0 && strcmp(argv[1], "-inum") != 0 && strcmp(argv[1], "-printi") != 0){
 138:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 13b:	52                   	push   %edx
 13c:	52                   	push   %edx
 13d:	68 58 10 00 00       	push   $0x1058
 142:	ff 70 04             	push   0x4(%eax)
 145:	e8 f6 07 00 00       	call   940 <strcmp>
 14a:	83 c4 10             	add    $0x10,%esp
 14d:	85 c0                	test   %eax,%eax
 14f:	74 cd                	je     11e <main+0x11e>
 151:	50                   	push   %eax
 152:	50                   	push   %eax
 153:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 156:	68 5e 10 00 00       	push   $0x105e
 15b:	ff 70 04             	push   0x4(%eax)
 15e:	e8 dd 07 00 00       	call   940 <strcmp>
 163:	83 c4 10             	add    $0x10,%esp
 166:	85 c0                	test   %eax,%eax
 168:	74 b4                	je     11e <main+0x11e>
 16a:	50                   	push   %eax
 16b:	50                   	push   %eax
 16c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 16f:	68 64 10 00 00       	push   $0x1064
 174:	ff 70 04             	push   0x4(%eax)
 177:	e8 c4 07 00 00       	call   940 <strcmp>
 17c:	83 c4 10             	add    $0x10,%esp
 17f:	85 c0                	test   %eax,%eax
 181:	74 9b                	je     11e <main+0x11e>
        memmove(path, argv[1], strlen(argv[1]));
 183:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 186:	83 ec 0c             	sub    $0xc,%esp
 189:	ff 77 04             	push   0x4(%edi)
 18c:	e8 0f 08 00 00       	call   9a0 <strlen>
 191:	83 c4 0c             	add    $0xc,%esp
 194:	50                   	push   %eax
 195:	ff 77 04             	push   0x4(%edi)
 198:	ff 75 c8             	push   -0x38(%ebp)
 19b:	e8 90 09 00 00       	call   b30 <memmove>
        continue;
 1a0:	83 c4 10             	add    $0x10,%esp
 1a3:	e9 47 ff ff ff       	jmp    ef <main+0xef>
  if(argc < 2) find(".", (void *)0, (void *)0, (void *)0, 0);
 1a8:	83 ec 0c             	sub    $0xc,%esp
 1ab:	6a 00                	push   $0x0
 1ad:	6a 00                	push   $0x0
 1af:	6a 00                	push   $0x0
 1b1:	6a 00                	push   $0x0
 1b3:	68 50 10 00 00       	push   $0x1050
 1b8:	e8 03 02 00 00       	call   3c0 <find>
 1bd:	83 c4 20             	add    $0x20,%esp
    free(path);
    if(name != (void *)0) free(name);
    if(type != (void *)0) free(type);
    if(inum != (void *)0) free(inum);
  }
  exit();
 1c0:	e8 9e 09 00 00       	call   b63 <exit>
        name = malloc(DIRSIZ);
 1c5:	83 ec 0c             	sub    $0xc,%esp
 1c8:	6a 0e                	push   $0xe
 1ca:	e8 21 0d 00 00       	call   ef0 <malloc>
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
 1e0:	68 6c 10 00 00       	push   $0x106c
 1e5:	6a 02                	push   $0x2
 1e7:	e8 d4 0a 00 00       	call   cc0 <printf>
          exit();
 1ec:	e8 72 09 00 00       	call   b63 <exit>
        type = malloc(DIRSIZ);
 1f1:	83 ec 0c             	sub    $0xc,%esp
 1f4:	6a 0e                	push   $0xe
 1f6:	e8 f5 0c 00 00       	call   ef0 <malloc>
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
 213:	68 32 10 00 00       	push   $0x1032
 218:	ff 36                	push   (%esi)
 21a:	e8 21 07 00 00       	call   940 <strcmp>
 21f:	83 c4 10             	add    $0x10,%esp
 222:	85 c0                	test   %eax,%eax
 224:	74 28                	je     24e <main+0x24e>
 226:	57                   	push   %edi
 227:	57                   	push   %edi
 228:	68 38 10 00 00       	push   $0x1038
 22d:	ff 36                	push   (%esi)
 22f:	e8 0c 07 00 00       	call   940 <strcmp>
 234:	83 c4 10             	add    $0x10,%esp
 237:	85 c0                	test   %eax,%eax
 239:	74 13                	je     24e <main+0x24e>
          printf(2, "find: incorrect type provided\n");
 23b:	51                   	push   %ecx
 23c:	51                   	push   %ecx
 23d:	68 f4 10 00 00       	push   $0x10f4
 242:	6a 02                	push   $0x2
 244:	e8 77 0a 00 00       	call   cc0 <printf>
          exit();
 249:	e8 15 09 00 00       	call   b63 <exit>
        memmove(type, argv[i+1], strlen(argv[i+1]));
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	ff 36                	push   (%esi)
        i++;
 253:	83 c3 01             	add    $0x1,%ebx
        memmove(type, argv[i+1], strlen(argv[i+1]));
 256:	e8 45 07 00 00       	call   9a0 <strlen>
 25b:	83 c4 0c             	add    $0xc,%esp
 25e:	50                   	push   %eax
 25f:	ff 36                	push   (%esi)
 261:	ff 75 d8             	push   -0x28(%ebp)
 264:	e8 c7 08 00 00       	call   b30 <memmove>
        continue;
 269:	83 c4 10             	add    $0x10,%esp
 26c:	e9 7e fe ff ff       	jmp    ef <main+0xef>
        inum = malloc(DIRSIZ);
 271:	83 ec 0c             	sub    $0xc,%esp
 274:	6a 0e                	push   $0xe
 276:	e8 75 0c 00 00       	call   ef0 <malloc>
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
 288:	68 9a 10 00 00       	push   $0x109a
 28d:	6a 02                	push   $0x2
 28f:	e8 2c 0a 00 00       	call   cc0 <printf>
          exit();
 294:	e8 ca 08 00 00       	call   b63 <exit>
        memmove(name, argv[i+1], strlen(argv[i+1]));
 299:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 29c:	83 ec 0c             	sub    $0xc,%esp
        i++;
 29f:	83 c3 01             	add    $0x1,%ebx
        memmove(name, argv[i+1], strlen(argv[i+1]));
 2a2:	8d 74 38 04          	lea    0x4(%eax,%edi,1),%esi
 2a6:	ff 36                	push   (%esi)
 2a8:	e8 f3 06 00 00       	call   9a0 <strlen>
 2ad:	83 c4 0c             	add    $0xc,%esp
 2b0:	50                   	push   %eax
 2b1:	ff 36                	push   (%esi)
 2b3:	ff 75 e0             	push   -0x20(%ebp)
 2b6:	e8 75 08 00 00       	call   b30 <memmove>
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
 2d2:	e8 c9 06 00 00       	call   9a0 <strlen>
 2d7:	83 c4 0c             	add    $0xc,%esp
 2da:	50                   	push   %eax
 2db:	ff 36                	push   (%esi)
 2dd:	ff 75 d4             	push   -0x2c(%ebp)
 2e0:	e8 4b 08 00 00       	call   b30 <memmove>
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
 30a:	e8 51 0b 00 00       	call   e60 <free>
    if(name != (void *)0) free(name);
 30f:	83 c4 10             	add    $0x10,%esp
 312:	85 ff                	test   %edi,%edi
 314:	74 0c                	je     322 <main+0x322>
 316:	83 ec 0c             	sub    $0xc,%esp
 319:	57                   	push   %edi
 31a:	e8 41 0b 00 00       	call   e60 <free>
 31f:	83 c4 10             	add    $0x10,%esp
    if(type != (void *)0) free(type);
 322:	8b 45 d8             	mov    -0x28(%ebp),%eax
 325:	85 c0                	test   %eax,%eax
 327:	74 0c                	je     335 <main+0x335>
 329:	83 ec 0c             	sub    $0xc,%esp
 32c:	50                   	push   %eax
 32d:	e8 2e 0b 00 00       	call   e60 <free>
 332:	83 c4 10             	add    $0x10,%esp
    if(inum != (void *)0) free(inum);
 335:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 338:	85 c0                	test   %eax,%eax
 33a:	0f 84 80 fe ff ff    	je     1c0 <main+0x1c0>
 340:	83 ec 0c             	sub    $0xc,%esp
 343:	50                   	push   %eax
 344:	e8 17 0b 00 00       	call   e60 <free>
 349:	83 c4 10             	add    $0x10,%esp
 34c:	e9 6f fe ff ff       	jmp    1c0 <main+0x1c0>
        printf(2, "find: incorrect flag entered\n");
 351:	50                   	push   %eax
 352:	50                   	push   %eax
 353:	68 b1 10 00 00       	push   $0x10b1
 358:	6a 02                	push   $0x2
 35a:	e8 61 09 00 00       	call   cc0 <printf>
        exit();
 35f:	e8 ff 07 00 00       	call   b63 <exit>
          printf(2, "find: no type entered\n");
 364:	50                   	push   %eax
 365:	50                   	push   %eax
 366:	68 83 10 00 00       	push   $0x1083
 36b:	6a 02                	push   $0x2
 36d:	e8 4e 09 00 00       	call   cc0 <printf>
          exit();
 372:	e8 ec 07 00 00       	call   b63 <exit>
 377:	66 90                	xchg   %ax,%ax
 379:	66 90                	xchg   %ax,%ax
 37b:	66 90                	xchg   %ax,%ax
 37d:	66 90                	xchg   %ax,%ax
 37f:	90                   	nop

00000380 <fmtname>:
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	83 ec 10             	sub    $0x10,%esp
 387:	8b 5d 08             	mov    0x8(%ebp),%ebx
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
 38a:	53                   	push   %ebx
 38b:	e8 10 06 00 00       	call   9a0 <strlen>
 390:	83 c4 10             	add    $0x10,%esp
 393:	01 d8                	add    %ebx,%eax
 395:	73 12                	jae    3a9 <fmtname+0x29>
 397:	eb 15                	jmp    3ae <fmtname+0x2e>
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3a0:	8d 50 ff             	lea    -0x1(%eax),%edx
 3a3:	39 d3                	cmp    %edx,%ebx
 3a5:	77 0a                	ja     3b1 <fmtname+0x31>
 3a7:	89 d0                	mov    %edx,%eax
 3a9:	80 38 2f             	cmpb   $0x2f,(%eax)
 3ac:	75 f2                	jne    3a0 <fmtname+0x20>
  p++;
 3ae:	83 c0 01             	add    $0x1,%eax
}
 3b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b4:	c9                   	leave  
 3b5:	c3                   	ret    
 3b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bd:	8d 76 00             	lea    0x0(%esi),%esi

000003c0 <find>:
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
 3c6:	83 ec 64             	sub    $0x64,%esp
 3c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cc:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 3cf:	6a 00                	push   $0x0
{
 3d1:	8b 75 14             	mov    0x14(%ebp),%esi
 3d4:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 3d7:	8b 45 10             	mov    0x10(%ebp),%eax
  if((fd = open(path, 0)) < 0){
 3da:	57                   	push   %edi
{
 3db:	89 45 b0             	mov    %eax,-0x50(%ebp)
 3de:	8b 45 18             	mov    0x18(%ebp),%eax
 3e1:	89 45 ac             	mov    %eax,-0x54(%ebp)
  if((fd = open(path, 0)) < 0){
 3e4:	e8 ba 07 00 00       	call   ba3 <open>
 3e9:	83 c4 10             	add    $0x10,%esp
 3ec:	85 c0                	test   %eax,%eax
 3ee:	0f 88 dc 02 00 00    	js     6d0 <find+0x310>
  if(fstat(fd, &st) < 0){
 3f4:	83 ec 08             	sub    $0x8,%esp
 3f7:	89 c3                	mov    %eax,%ebx
 3f9:	8d 45 d4             	lea    -0x2c(%ebp),%eax
 3fc:	50                   	push   %eax
 3fd:	53                   	push   %ebx
 3fe:	e8 b8 07 00 00       	call   bbb <fstat>
 403:	83 c4 10             	add    $0x10,%esp
 406:	85 c0                	test   %eax,%eax
 408:	0f 88 aa 03 00 00    	js     7b8 <find+0x3f8>
  if(inum != (void *)0){
 40e:	85 f6                	test   %esi,%esi
 410:	0f 84 d2 01 00 00    	je     5e8 <find+0x228>
    char* temp = malloc(DIRSIZ);
 416:	83 ec 0c             	sub    $0xc,%esp
 419:	6a 0e                	push   $0xe
 41b:	e8 d0 0a 00 00       	call   ef0 <malloc>
    if(inum[0] == '+'){
 420:	83 c4 10             	add    $0x10,%esp
    char* temp = malloc(DIRSIZ);
 423:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    if(inum[0] == '+'){
 426:	0f b6 06             	movzbl (%esi),%eax
 429:	3c 2b                	cmp    $0x2b,%al
 42b:	0f 84 af 03 00 00    	je     7e0 <find+0x420>
    else if(inum[0] == '-'){
 431:	3c 2d                	cmp    $0x2d,%al
 433:	0f 84 2f 03 00 00    	je     768 <find+0x3a8>
    else inodenum = atoi(inum);
 439:	83 ec 0c             	sub    $0xc,%esp
 43c:	56                   	push   %esi
 43d:	e8 ae 06 00 00       	call   af0 <atoi>
    inumCompare = 0;
 442:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%ebp)
    else inodenum = atoi(inum);
 449:	83 c4 10             	add    $0x10,%esp
 44c:	89 45 a8             	mov    %eax,-0x58(%ebp)
    if(inodenum == 0){
 44f:	8b 4d a8             	mov    -0x58(%ebp),%ecx
 452:	85 c9                	test   %ecx,%ecx
 454:	0f 84 85 04 00 00    	je     8df <find+0x51f>
    free(temp);
 45a:	83 ec 0c             	sub    $0xc,%esp
 45d:	ff 75 a4             	push   -0x5c(%ebp)
 460:	e8 fb 09 00 00       	call   e60 <free>
  switch(st.type){
 465:	0f b7 45 d4          	movzwl -0x2c(%ebp),%eax
    free(temp);
 469:	83 c4 10             	add    $0x10,%esp
  switch(st.type){
 46c:	66 83 f8 01          	cmp    $0x1,%ax
 470:	0f 85 8e 01 00 00    	jne    604 <find+0x244>
    if((name == (void *)0 || strcmp(name, fmtname(path)) == 0)
 476:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 479:	85 c0                	test   %eax,%eax
 47b:	0f 84 6f 02 00 00    	je     6f0 <find+0x330>
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
 481:	83 ec 0c             	sub    $0xc,%esp
 484:	57                   	push   %edi
 485:	e8 16 05 00 00       	call   9a0 <strlen>
 48a:	83 c4 10             	add    $0x10,%esp
 48d:	01 f8                	add    %edi,%eax
 48f:	73 10                	jae    4a1 <find+0xe1>
 491:	eb 13                	jmp    4a6 <find+0xe6>
 493:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 497:	90                   	nop
 498:	8d 50 ff             	lea    -0x1(%eax),%edx
 49b:	39 d7                	cmp    %edx,%edi
 49d:	77 0a                	ja     4a9 <find+0xe9>
 49f:	89 d0                	mov    %edx,%eax
 4a1:	80 38 2f             	cmpb   $0x2f,(%eax)
 4a4:	75 f2                	jne    498 <find+0xd8>
  p++;
 4a6:	83 c0 01             	add    $0x1,%eax
    if((name == (void *)0 || strcmp(name, fmtname(path)) == 0)
 4a9:	83 ec 08             	sub    $0x8,%esp
 4ac:	50                   	push   %eax
 4ad:	ff 75 b4             	push   -0x4c(%ebp)
 4b0:	e8 8b 04 00 00       	call   940 <strcmp>
 4b5:	83 c4 10             	add    $0x10,%esp
 4b8:	85 c0                	test   %eax,%eax
 4ba:	0f 84 30 02 00 00    	je     6f0 <find+0x330>
    if(strlen(path) + 1 + DIRSIZ + 1 > 512){
 4c0:	83 ec 0c             	sub    $0xc,%esp
 4c3:	57                   	push   %edi
 4c4:	e8 d7 04 00 00       	call   9a0 <strlen>
 4c9:	83 c4 10             	add    $0x10,%esp
 4cc:	83 c0 10             	add    $0x10,%eax
 4cf:	3d 00 02 00 00       	cmp    $0x200,%eax
 4d4:	0f 87 76 03 00 00    	ja     850 <find+0x490>
 4da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 4e0:	83 ec 04             	sub    $0x4,%esp
 4e3:	8d 45 c4             	lea    -0x3c(%ebp),%eax
 4e6:	6a 10                	push   $0x10
 4e8:	50                   	push   %eax
 4e9:	53                   	push   %ebx
 4ea:	e8 8c 06 00 00       	call   b7b <read>
 4ef:	83 c4 10             	add    $0x10,%esp
 4f2:	83 f8 10             	cmp    $0x10,%eax
 4f5:	0f 85 a5 02 00 00    	jne    7a0 <find+0x3e0>
      if(de.inum == 0)
 4fb:	66 83 7d c4 00       	cmpw   $0x0,-0x3c(%ebp)
 500:	74 de                	je     4e0 <find+0x120>
      if(strcmp(de.name, ".") != 0 && strcmp(de.name, "..") != 0){
 502:	83 ec 08             	sub    $0x8,%esp
 505:	8d 45 c6             	lea    -0x3a(%ebp),%eax
 508:	68 50 10 00 00       	push   $0x1050
 50d:	50                   	push   %eax
 50e:	e8 2d 04 00 00       	call   940 <strcmp>
 513:	83 c4 10             	add    $0x10,%esp
 516:	85 c0                	test   %eax,%eax
 518:	74 c6                	je     4e0 <find+0x120>
 51a:	83 ec 08             	sub    $0x8,%esp
 51d:	8d 45 c6             	lea    -0x3a(%ebp),%eax
 520:	68 4f 10 00 00       	push   $0x104f
 525:	50                   	push   %eax
 526:	e8 15 04 00 00       	call   940 <strcmp>
 52b:	83 c4 10             	add    $0x10,%esp
 52e:	85 c0                	test   %eax,%eax
 530:	74 ae                	je     4e0 <find+0x120>
        char *newPath = malloc(strlen(path) + strlen(de.name) + 2);
 532:	83 ec 0c             	sub    $0xc,%esp
 535:	57                   	push   %edi
 536:	e8 65 04 00 00       	call   9a0 <strlen>
 53b:	89 45 a8             	mov    %eax,-0x58(%ebp)
 53e:	8d 45 c6             	lea    -0x3a(%ebp),%eax
 541:	89 04 24             	mov    %eax,(%esp)
 544:	e8 57 04 00 00       	call   9a0 <strlen>
 549:	8b 55 a8             	mov    -0x58(%ebp),%edx
 54c:	8d 44 02 02          	lea    0x2(%edx,%eax,1),%eax
 550:	89 04 24             	mov    %eax,(%esp)
 553:	e8 98 09 00 00       	call   ef0 <malloc>
        if (!newPath) {
 558:	83 c4 10             	add    $0x10,%esp
        char *newPath = malloc(strlen(path) + strlen(de.name) + 2);
 55b:	89 45 a8             	mov    %eax,-0x58(%ebp)
        if (!newPath) {
 55e:	85 c0                	test   %eax,%eax
 560:	0f 84 8c 03 00 00    	je     8f2 <find+0x532>
        memmove(newPath, path, strlen(path));
 566:	83 ec 0c             	sub    $0xc,%esp
 569:	57                   	push   %edi
 56a:	e8 31 04 00 00       	call   9a0 <strlen>
 56f:	83 c4 0c             	add    $0xc,%esp
 572:	50                   	push   %eax
 573:	57                   	push   %edi
 574:	ff 75 a8             	push   -0x58(%ebp)
 577:	e8 b4 05 00 00       	call   b30 <memmove>
        newPath[strlen(path)] = '/';
 57c:	89 3c 24             	mov    %edi,(%esp)
 57f:	e8 1c 04 00 00       	call   9a0 <strlen>
 584:	8b 4d a8             	mov    -0x58(%ebp),%ecx
 587:	c6 04 01 2f          	movb   $0x2f,(%ecx,%eax,1)
        memmove(newPath + strlen(path) + 1, de.name, strlen(de.name) + 1);
 58b:	8d 45 c6             	lea    -0x3a(%ebp),%eax
 58e:	89 04 24             	mov    %eax,(%esp)
 591:	e8 0a 04 00 00       	call   9a0 <strlen>
 596:	89 3c 24             	mov    %edi,(%esp)
 599:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 59c:	e8 ff 03 00 00       	call   9a0 <strlen>
 5a1:	83 c4 0c             	add    $0xc,%esp
 5a4:	8b 4d a8             	mov    -0x58(%ebp),%ecx
 5a7:	89 c2                	mov    %eax,%edx
 5a9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 5ac:	83 c0 01             	add    $0x1,%eax
 5af:	50                   	push   %eax
 5b0:	8d 45 c6             	lea    -0x3a(%ebp),%eax
 5b3:	50                   	push   %eax
 5b4:	8d 44 11 01          	lea    0x1(%ecx,%edx,1),%eax
 5b8:	50                   	push   %eax
 5b9:	e8 72 05 00 00       	call   b30 <memmove>
        find(newPath, name, type, inum, printi);
 5be:	58                   	pop    %eax
 5bf:	ff 75 ac             	push   -0x54(%ebp)
 5c2:	56                   	push   %esi
 5c3:	ff 75 b0             	push   -0x50(%ebp)
 5c6:	ff 75 b4             	push   -0x4c(%ebp)
 5c9:	ff 75 a8             	push   -0x58(%ebp)
 5cc:	e8 ef fd ff ff       	call   3c0 <find>
        free(newPath);
 5d1:	83 c4 14             	add    $0x14,%esp
 5d4:	ff 75 a8             	push   -0x58(%ebp)
 5d7:	e8 84 08 00 00       	call   e60 <free>
 5dc:	83 c4 10             	add    $0x10,%esp
 5df:	e9 fc fe ff ff       	jmp    4e0 <find+0x120>
 5e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  switch(st.type){
 5e8:	0f b7 45 d4          	movzwl -0x2c(%ebp),%eax
  int inumCompare = -1;
 5ec:	c7 45 a0 ff ff ff ff 	movl   $0xffffffff,-0x60(%ebp)
  int inodenum = -1;
 5f3:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%ebp)
  switch(st.type){
 5fa:	66 83 f8 01          	cmp    $0x1,%ax
 5fe:	0f 84 72 fe ff ff    	je     476 <find+0xb6>
 604:	66 83 f8 02          	cmp    $0x2,%ax
 608:	0f 85 aa 00 00 00    	jne    6b8 <find+0x2f8>
    if((name == (void *)0 || strcmp(name, fmtname(path)) == 0)
 60e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 611:	85 c0                	test   %eax,%eax
 613:	74 3f                	je     654 <find+0x294>
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
 615:	83 ec 0c             	sub    $0xc,%esp
 618:	57                   	push   %edi
 619:	e8 82 03 00 00       	call   9a0 <strlen>
 61e:	83 c4 10             	add    $0x10,%esp
 621:	01 f8                	add    %edi,%eax
 623:	73 14                	jae    639 <find+0x279>
 625:	eb 17                	jmp    63e <find+0x27e>
 627:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62e:	66 90                	xchg   %ax,%ax
 630:	8d 50 ff             	lea    -0x1(%eax),%edx
 633:	39 d7                	cmp    %edx,%edi
 635:	77 0a                	ja     641 <find+0x281>
 637:	89 d0                	mov    %edx,%eax
 639:	80 38 2f             	cmpb   $0x2f,(%eax)
 63c:	75 f2                	jne    630 <find+0x270>
  p++;
 63e:	83 c0 01             	add    $0x1,%eax
    if((name == (void *)0 || strcmp(name, fmtname(path)) == 0)
 641:	83 ec 08             	sub    $0x8,%esp
 644:	50                   	push   %eax
 645:	ff 75 b4             	push   -0x4c(%ebp)
 648:	e8 f3 02 00 00       	call   940 <strcmp>
 64d:	83 c4 10             	add    $0x10,%esp
 650:	85 c0                	test   %eax,%eax
 652:	75 64                	jne    6b8 <find+0x2f8>
      && (type == (void *)0 || strcmp(type, "f") == 0)
 654:	8b 45 b0             	mov    -0x50(%ebp),%eax
 657:	85 c0                	test   %eax,%eax
 659:	74 17                	je     672 <find+0x2b2>
 65b:	83 ec 08             	sub    $0x8,%esp
 65e:	68 32 10 00 00       	push   $0x1032
 663:	ff 75 b0             	push   -0x50(%ebp)
 666:	e8 d5 02 00 00       	call   940 <strcmp>
 66b:	83 c4 10             	add    $0x10,%esp
 66e:	85 c0                	test   %eax,%eax
 670:	75 46                	jne    6b8 <find+0x2f8>
      && (inum == (void *)0 || (inumCompare == 0 && st.ino == inodenum) || (inumCompare == 1 && st.ino > inodenum) || (inumCompare == 2 && st.ino < inodenum))){
 672:	85 f6                	test   %esi,%esi
 674:	74 22                	je     698 <find+0x2d8>
 676:	8b 45 a0             	mov    -0x60(%ebp),%eax
 679:	85 c0                	test   %eax,%eax
 67b:	0f 84 9f 01 00 00    	je     820 <find+0x460>
 681:	83 7d a0 01          	cmpl   $0x1,-0x60(%ebp)
 685:	0f 85 e5 01 00 00    	jne    870 <find+0x4b0>
 68b:	8b 45 a8             	mov    -0x58(%ebp),%eax
 68e:	39 45 dc             	cmp    %eax,-0x24(%ebp)
 691:	76 25                	jbe    6b8 <find+0x2f8>
 693:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 697:	90                   	nop
        if(printi == 1) printf(1, "%d ", st.ino);
 698:	83 7d ac 01          	cmpl   $0x1,-0x54(%ebp)
 69c:	0f 84 09 02 00 00    	je     8ab <find+0x4eb>
        printf(1, "%s\n", path);
 6a2:	83 ec 04             	sub    $0x4,%esp
 6a5:	57                   	push   %edi
 6a6:	68 fa 0f 00 00       	push   $0xffa
 6ab:	6a 01                	push   $0x1
 6ad:	e8 0e 06 00 00       	call   cc0 <printf>
 6b2:	83 c4 10             	add    $0x10,%esp
 6b5:	8d 76 00             	lea    0x0(%esi),%esi
  close(fd);
 6b8:	83 ec 0c             	sub    $0xc,%esp
 6bb:	53                   	push   %ebx
 6bc:	e8 ca 04 00 00       	call   b8b <close>
 6c1:	83 c4 10             	add    $0x10,%esp
}
 6c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6c7:	5b                   	pop    %ebx
 6c8:	5e                   	pop    %esi
 6c9:	5f                   	pop    %edi
 6ca:	5d                   	pop    %ebp
 6cb:	c3                   	ret    
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "find: cannot open %s\n", path);
 6d0:	89 7d 10             	mov    %edi,0x10(%ebp)
 6d3:	c7 45 0c e8 0f 00 00 	movl   $0xfe8,0xc(%ebp)
 6da:	c7 45 08 02 00 00 00 	movl   $0x2,0x8(%ebp)
}
 6e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6e4:	5b                   	pop    %ebx
 6e5:	5e                   	pop    %esi
 6e6:	5f                   	pop    %edi
 6e7:	5d                   	pop    %ebp
    printf(2, "find: cannot open %s\n", path);
 6e8:	e9 d3 05 00 00       	jmp    cc0 <printf>
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
      && (type == (void *)0 || strcmp(type, "d") == 0)
 6f0:	8b 45 b0             	mov    -0x50(%ebp),%eax
 6f3:	85 c0                	test   %eax,%eax
 6f5:	74 1b                	je     712 <find+0x352>
 6f7:	83 ec 08             	sub    $0x8,%esp
 6fa:	68 38 10 00 00       	push   $0x1038
 6ff:	ff 75 b0             	push   -0x50(%ebp)
 702:	e8 39 02 00 00       	call   940 <strcmp>
 707:	83 c4 10             	add    $0x10,%esp
 70a:	85 c0                	test   %eax,%eax
 70c:	0f 85 ae fd ff ff    	jne    4c0 <find+0x100>
      && (inum == (void *)0 || (inumCompare == 0 && st.ino == inodenum) || (inumCompare == 1 && st.ino > inodenum) || (inumCompare == 2 && st.ino < inodenum))){
 712:	85 f6                	test   %esi,%esi
 714:	74 2a                	je     740 <find+0x380>
 716:	8b 4d a0             	mov    -0x60(%ebp),%ecx
 719:	85 c9                	test   %ecx,%ecx
 71b:	0f 84 17 01 00 00    	je     838 <find+0x478>
 721:	83 7d a0 01          	cmpl   $0x1,-0x60(%ebp)
 725:	0f 85 65 01 00 00    	jne    890 <find+0x4d0>
 72b:	8b 45 a8             	mov    -0x58(%ebp),%eax
 72e:	39 45 dc             	cmp    %eax,-0x24(%ebp)
 731:	0f 86 89 fd ff ff    	jbe    4c0 <find+0x100>
 737:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73e:	66 90                	xchg   %ax,%ax
        if(printi == 1) printf(1, "%d ", st.ino);
 740:	83 7d ac 01          	cmpl   $0x1,-0x54(%ebp)
 744:	0f 84 7b 01 00 00    	je     8c5 <find+0x505>
        printf(1, "%s\n", path);
 74a:	83 ec 04             	sub    $0x4,%esp
 74d:	57                   	push   %edi
 74e:	68 fa 0f 00 00       	push   $0xffa
 753:	6a 01                	push   $0x1
 755:	e8 66 05 00 00       	call   cc0 <printf>
 75a:	83 c4 10             	add    $0x10,%esp
 75d:	e9 5e fd ff ff       	jmp    4c0 <find+0x100>
 762:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      memmove(temp, inum+1, strlen(inum)-1);
 768:	83 ec 0c             	sub    $0xc,%esp
 76b:	56                   	push   %esi
 76c:	e8 2f 02 00 00       	call   9a0 <strlen>
 771:	83 c4 0c             	add    $0xc,%esp
 774:	83 e8 01             	sub    $0x1,%eax
 777:	50                   	push   %eax
 778:	8d 46 01             	lea    0x1(%esi),%eax
 77b:	50                   	push   %eax
 77c:	ff 75 a4             	push   -0x5c(%ebp)
 77f:	e8 ac 03 00 00       	call   b30 <memmove>
      inodenum = atoi(temp);
 784:	58                   	pop    %eax
 785:	ff 75 a4             	push   -0x5c(%ebp)
 788:	e8 63 03 00 00       	call   af0 <atoi>
      inumCompare = 2;
 78d:	c7 45 a0 02 00 00 00 	movl   $0x2,-0x60(%ebp)
 794:	83 c4 10             	add    $0x10,%esp
      inodenum = atoi(temp);
 797:	89 45 a8             	mov    %eax,-0x58(%ebp)
 79a:	e9 b0 fc ff ff       	jmp    44f <find+0x8f>
 79f:	90                   	nop
    close(fd);
 7a0:	83 ec 0c             	sub    $0xc,%esp
 7a3:	53                   	push   %ebx
 7a4:	e8 e2 03 00 00       	call   b8b <close>
    break;
 7a9:	83 c4 10             	add    $0x10,%esp
 7ac:	e9 07 ff ff ff       	jmp    6b8 <find+0x2f8>
 7b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "find: cannot stat %s\n", path);
 7b8:	83 ec 04             	sub    $0x4,%esp
 7bb:	57                   	push   %edi
 7bc:	68 fe 0f 00 00       	push   $0xffe
 7c1:	6a 02                	push   $0x2
 7c3:	e8 f8 04 00 00       	call   cc0 <printf>
    close(fd);
 7c8:	89 1c 24             	mov    %ebx,(%esp)
 7cb:	e8 bb 03 00 00       	call   b8b <close>
    return;
 7d0:	83 c4 10             	add    $0x10,%esp
}
 7d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7d6:	5b                   	pop    %ebx
 7d7:	5e                   	pop    %esi
 7d8:	5f                   	pop    %edi
 7d9:	5d                   	pop    %ebp
 7da:	c3                   	ret    
 7db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7df:	90                   	nop
      memmove(temp, inum+1, strlen(inum)-1);
 7e0:	83 ec 0c             	sub    $0xc,%esp
 7e3:	56                   	push   %esi
 7e4:	e8 b7 01 00 00       	call   9a0 <strlen>
 7e9:	83 c4 0c             	add    $0xc,%esp
 7ec:	83 e8 01             	sub    $0x1,%eax
 7ef:	50                   	push   %eax
 7f0:	8d 46 01             	lea    0x1(%esi),%eax
 7f3:	50                   	push   %eax
 7f4:	ff 75 a4             	push   -0x5c(%ebp)
 7f7:	e8 34 03 00 00       	call   b30 <memmove>
      inodenum = atoi(temp);
 7fc:	58                   	pop    %eax
 7fd:	ff 75 a4             	push   -0x5c(%ebp)
 800:	e8 eb 02 00 00       	call   af0 <atoi>
      inumCompare = 1;
 805:	c7 45 a0 01 00 00 00 	movl   $0x1,-0x60(%ebp)
 80c:	83 c4 10             	add    $0x10,%esp
      inodenum = atoi(temp);
 80f:	89 45 a8             	mov    %eax,-0x58(%ebp)
 812:	e9 38 fc ff ff       	jmp    44f <find+0x8f>
 817:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 81e:	66 90                	xchg   %ax,%ax
      && (inum == (void *)0 || (inumCompare == 0 && st.ino == inodenum) || (inumCompare == 1 && st.ino > inodenum) || (inumCompare == 2 && st.ino < inodenum))){
 820:	8b 45 a8             	mov    -0x58(%ebp),%eax
 823:	39 45 dc             	cmp    %eax,-0x24(%ebp)
 826:	0f 85 8c fe ff ff    	jne    6b8 <find+0x2f8>
 82c:	e9 67 fe ff ff       	jmp    698 <find+0x2d8>
 831:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      && (inum == (void *)0 || (inumCompare == 0 && st.ino == inodenum) || (inumCompare == 1 && st.ino > inodenum) || (inumCompare == 2 && st.ino < inodenum))){
 838:	8b 45 a8             	mov    -0x58(%ebp),%eax
 83b:	39 45 dc             	cmp    %eax,-0x24(%ebp)
 83e:	0f 85 7c fc ff ff    	jne    4c0 <find+0x100>
 844:	e9 f7 fe ff ff       	jmp    740 <find+0x380>
 849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "find: path too long\n");
 850:	83 ec 08             	sub    $0x8,%esp
 853:	68 3a 10 00 00       	push   $0x103a
 858:	6a 01                	push   $0x1
 85a:	e8 61 04 00 00       	call   cc0 <printf>
      close(fd);
 85f:	89 1c 24             	mov    %ebx,(%esp)
 862:	e8 24 03 00 00       	call   b8b <close>
      return;
 867:	83 c4 10             	add    $0x10,%esp
 86a:	e9 55 fe ff ff       	jmp    6c4 <find+0x304>
 86f:	90                   	nop
      && (inum == (void *)0 || (inumCompare == 0 && st.ino == inodenum) || (inumCompare == 1 && st.ino > inodenum) || (inumCompare == 2 && st.ino < inodenum))){
 870:	83 7d a0 02          	cmpl   $0x2,-0x60(%ebp)
 874:	0f 85 3e fe ff ff    	jne    6b8 <find+0x2f8>
 87a:	8b 45 a8             	mov    -0x58(%ebp),%eax
 87d:	39 45 dc             	cmp    %eax,-0x24(%ebp)
 880:	0f 83 32 fe ff ff    	jae    6b8 <find+0x2f8>
 886:	e9 0d fe ff ff       	jmp    698 <find+0x2d8>
 88b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 88f:	90                   	nop
      && (inum == (void *)0 || (inumCompare == 0 && st.ino == inodenum) || (inumCompare == 1 && st.ino > inodenum) || (inumCompare == 2 && st.ino < inodenum))){
 890:	83 7d a0 02          	cmpl   $0x2,-0x60(%ebp)
 894:	0f 85 26 fc ff ff    	jne    4c0 <find+0x100>
 89a:	8b 45 a8             	mov    -0x58(%ebp),%eax
 89d:	39 45 dc             	cmp    %eax,-0x24(%ebp)
 8a0:	0f 83 1a fc ff ff    	jae    4c0 <find+0x100>
 8a6:	e9 95 fe ff ff       	jmp    740 <find+0x380>
        if(printi == 1) printf(1, "%d ", st.ino);
 8ab:	83 ec 04             	sub    $0x4,%esp
 8ae:	ff 75 dc             	push   -0x24(%ebp)
 8b1:	68 34 10 00 00       	push   $0x1034
 8b6:	6a 01                	push   $0x1
 8b8:	e8 03 04 00 00       	call   cc0 <printf>
 8bd:	83 c4 10             	add    $0x10,%esp
 8c0:	e9 dd fd ff ff       	jmp    6a2 <find+0x2e2>
        if(printi == 1) printf(1, "%d ", st.ino);
 8c5:	83 ec 04             	sub    $0x4,%esp
 8c8:	ff 75 dc             	push   -0x24(%ebp)
 8cb:	68 34 10 00 00       	push   $0x1034
 8d0:	6a 01                	push   $0x1
 8d2:	e8 e9 03 00 00       	call   cc0 <printf>
 8d7:	83 c4 10             	add    $0x10,%esp
 8da:	e9 6b fe ff ff       	jmp    74a <find+0x38a>
      printf(2, "find: incorrect inum entered\n");
 8df:	52                   	push   %edx
 8e0:	52                   	push   %edx
 8e1:	68 14 10 00 00       	push   $0x1014
 8e6:	6a 02                	push   $0x2
 8e8:	e8 d3 03 00 00       	call   cc0 <printf>
      exit();
 8ed:	e8 71 02 00 00       	call   b63 <exit>
            printf(2, "find: failed to allocate memory\n");
 8f2:	52                   	push   %edx
 8f3:	52                   	push   %edx
 8f4:	68 d0 10 00 00       	push   $0x10d0
 8f9:	6a 02                	push   $0x2
 8fb:	e8 c0 03 00 00       	call   cc0 <printf>
            close(fd);
 900:	89 1c 24             	mov    %ebx,(%esp)
 903:	e8 83 02 00 00       	call   b8b <close>
            exit();
 908:	e8 56 02 00 00       	call   b63 <exit>
 90d:	66 90                	xchg   %ax,%ax
 90f:	90                   	nop

00000910 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 910:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 911:	31 c0                	xor    %eax,%eax
{
 913:	89 e5                	mov    %esp,%ebp
 915:	53                   	push   %ebx
 916:	8b 4d 08             	mov    0x8(%ebp),%ecx
 919:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 91c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 920:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 924:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 927:	83 c0 01             	add    $0x1,%eax
 92a:	84 d2                	test   %dl,%dl
 92c:	75 f2                	jne    920 <strcpy+0x10>
    ;
  return os;
}
 92e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 931:	89 c8                	mov    %ecx,%eax
 933:	c9                   	leave  
 934:	c3                   	ret    
 935:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000940 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
 943:	53                   	push   %ebx
 944:	8b 55 08             	mov    0x8(%ebp),%edx
 947:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 94a:	0f b6 02             	movzbl (%edx),%eax
 94d:	84 c0                	test   %al,%al
 94f:	75 17                	jne    968 <strcmp+0x28>
 951:	eb 3a                	jmp    98d <strcmp+0x4d>
 953:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 957:	90                   	nop
 958:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 95c:	83 c2 01             	add    $0x1,%edx
 95f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 962:	84 c0                	test   %al,%al
 964:	74 1a                	je     980 <strcmp+0x40>
    p++, q++;
 966:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 968:	0f b6 19             	movzbl (%ecx),%ebx
 96b:	38 c3                	cmp    %al,%bl
 96d:	74 e9                	je     958 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 96f:	29 d8                	sub    %ebx,%eax
}
 971:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 974:	c9                   	leave  
 975:	c3                   	ret    
 976:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 97d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 980:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 984:	31 c0                	xor    %eax,%eax
 986:	29 d8                	sub    %ebx,%eax
}
 988:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 98b:	c9                   	leave  
 98c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 98d:	0f b6 19             	movzbl (%ecx),%ebx
 990:	31 c0                	xor    %eax,%eax
 992:	eb db                	jmp    96f <strcmp+0x2f>
 994:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 99b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 99f:	90                   	nop

000009a0 <strlen>:

uint
strlen(const char *s)
{
 9a0:	55                   	push   %ebp
 9a1:	89 e5                	mov    %esp,%ebp
 9a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 9a6:	80 3a 00             	cmpb   $0x0,(%edx)
 9a9:	74 15                	je     9c0 <strlen+0x20>
 9ab:	31 c0                	xor    %eax,%eax
 9ad:	8d 76 00             	lea    0x0(%esi),%esi
 9b0:	83 c0 01             	add    $0x1,%eax
 9b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 9b7:	89 c1                	mov    %eax,%ecx
 9b9:	75 f5                	jne    9b0 <strlen+0x10>
    ;
  return n;
}
 9bb:	89 c8                	mov    %ecx,%eax
 9bd:	5d                   	pop    %ebp
 9be:	c3                   	ret    
 9bf:	90                   	nop
  for(n = 0; s[n]; n++)
 9c0:	31 c9                	xor    %ecx,%ecx
}
 9c2:	5d                   	pop    %ebp
 9c3:	89 c8                	mov    %ecx,%eax
 9c5:	c3                   	ret    
 9c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9cd:	8d 76 00             	lea    0x0(%esi),%esi

000009d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
 9d3:	57                   	push   %edi
 9d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 9d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 9da:	8b 45 0c             	mov    0xc(%ebp),%eax
 9dd:	89 d7                	mov    %edx,%edi
 9df:	fc                   	cld    
 9e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 9e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 9e5:	89 d0                	mov    %edx,%eax
 9e7:	c9                   	leave  
 9e8:	c3                   	ret    
 9e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009f0 <strchr>:

char*
strchr(const char *s, char c)
{
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
 9f3:	8b 45 08             	mov    0x8(%ebp),%eax
 9f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 9fa:	0f b6 10             	movzbl (%eax),%edx
 9fd:	84 d2                	test   %dl,%dl
 9ff:	75 12                	jne    a13 <strchr+0x23>
 a01:	eb 1d                	jmp    a20 <strchr+0x30>
 a03:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a07:	90                   	nop
 a08:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 a0c:	83 c0 01             	add    $0x1,%eax
 a0f:	84 d2                	test   %dl,%dl
 a11:	74 0d                	je     a20 <strchr+0x30>
    if(*s == c)
 a13:	38 d1                	cmp    %dl,%cl
 a15:	75 f1                	jne    a08 <strchr+0x18>
      return (char*)s;
  return 0;
}
 a17:	5d                   	pop    %ebp
 a18:	c3                   	ret    
 a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 a20:	31 c0                	xor    %eax,%eax
}
 a22:	5d                   	pop    %ebp
 a23:	c3                   	ret    
 a24:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a2f:	90                   	nop

00000a30 <gets>:

char*
gets(char *buf, int max)
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
 a33:	57                   	push   %edi
 a34:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 a35:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 a38:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 a39:	31 db                	xor    %ebx,%ebx
{
 a3b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 a3e:	eb 27                	jmp    a67 <gets+0x37>
    cc = read(0, &c, 1);
 a40:	83 ec 04             	sub    $0x4,%esp
 a43:	6a 01                	push   $0x1
 a45:	57                   	push   %edi
 a46:	6a 00                	push   $0x0
 a48:	e8 2e 01 00 00       	call   b7b <read>
    if(cc < 1)
 a4d:	83 c4 10             	add    $0x10,%esp
 a50:	85 c0                	test   %eax,%eax
 a52:	7e 1d                	jle    a71 <gets+0x41>
      break;
    buf[i++] = c;
 a54:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 a58:	8b 55 08             	mov    0x8(%ebp),%edx
 a5b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 a5f:	3c 0a                	cmp    $0xa,%al
 a61:	74 1d                	je     a80 <gets+0x50>
 a63:	3c 0d                	cmp    $0xd,%al
 a65:	74 19                	je     a80 <gets+0x50>
  for(i=0; i+1 < max; ){
 a67:	89 de                	mov    %ebx,%esi
 a69:	83 c3 01             	add    $0x1,%ebx
 a6c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 a6f:	7c cf                	jl     a40 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 a71:	8b 45 08             	mov    0x8(%ebp),%eax
 a74:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 a78:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a7b:	5b                   	pop    %ebx
 a7c:	5e                   	pop    %esi
 a7d:	5f                   	pop    %edi
 a7e:	5d                   	pop    %ebp
 a7f:	c3                   	ret    
  buf[i] = '\0';
 a80:	8b 45 08             	mov    0x8(%ebp),%eax
 a83:	89 de                	mov    %ebx,%esi
 a85:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 a89:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a8c:	5b                   	pop    %ebx
 a8d:	5e                   	pop    %esi
 a8e:	5f                   	pop    %edi
 a8f:	5d                   	pop    %ebp
 a90:	c3                   	ret    
 a91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a9f:	90                   	nop

00000aa0 <stat>:

int
stat(const char *n, struct stat *st)
{
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
 aa3:	56                   	push   %esi
 aa4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 aa5:	83 ec 08             	sub    $0x8,%esp
 aa8:	6a 00                	push   $0x0
 aaa:	ff 75 08             	push   0x8(%ebp)
 aad:	e8 f1 00 00 00       	call   ba3 <open>
  if(fd < 0)
 ab2:	83 c4 10             	add    $0x10,%esp
 ab5:	85 c0                	test   %eax,%eax
 ab7:	78 27                	js     ae0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 ab9:	83 ec 08             	sub    $0x8,%esp
 abc:	ff 75 0c             	push   0xc(%ebp)
 abf:	89 c3                	mov    %eax,%ebx
 ac1:	50                   	push   %eax
 ac2:	e8 f4 00 00 00       	call   bbb <fstat>
  close(fd);
 ac7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 aca:	89 c6                	mov    %eax,%esi
  close(fd);
 acc:	e8 ba 00 00 00       	call   b8b <close>
  return r;
 ad1:	83 c4 10             	add    $0x10,%esp
}
 ad4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 ad7:	89 f0                	mov    %esi,%eax
 ad9:	5b                   	pop    %ebx
 ada:	5e                   	pop    %esi
 adb:	5d                   	pop    %ebp
 adc:	c3                   	ret    
 add:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 ae0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 ae5:	eb ed                	jmp    ad4 <stat+0x34>
 ae7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 aee:	66 90                	xchg   %ax,%ax

00000af0 <atoi>:

int
atoi(const char *s)
{
 af0:	55                   	push   %ebp
 af1:	89 e5                	mov    %esp,%ebp
 af3:	53                   	push   %ebx
 af4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 af7:	0f be 02             	movsbl (%edx),%eax
 afa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 afd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 b00:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 b05:	77 1e                	ja     b25 <atoi+0x35>
 b07:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b0e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 b10:	83 c2 01             	add    $0x1,%edx
 b13:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 b16:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 b1a:	0f be 02             	movsbl (%edx),%eax
 b1d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 b20:	80 fb 09             	cmp    $0x9,%bl
 b23:	76 eb                	jbe    b10 <atoi+0x20>
  return n;
}
 b25:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b28:	89 c8                	mov    %ecx,%eax
 b2a:	c9                   	leave  
 b2b:	c3                   	ret    
 b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b30 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 b30:	55                   	push   %ebp
 b31:	89 e5                	mov    %esp,%ebp
 b33:	57                   	push   %edi
 b34:	8b 45 10             	mov    0x10(%ebp),%eax
 b37:	8b 55 08             	mov    0x8(%ebp),%edx
 b3a:	56                   	push   %esi
 b3b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 b3e:	85 c0                	test   %eax,%eax
 b40:	7e 13                	jle    b55 <memmove+0x25>
 b42:	01 d0                	add    %edx,%eax
  dst = vdst;
 b44:	89 d7                	mov    %edx,%edi
 b46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b4d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 b50:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 b51:	39 f8                	cmp    %edi,%eax
 b53:	75 fb                	jne    b50 <memmove+0x20>
  return vdst;
}
 b55:	5e                   	pop    %esi
 b56:	89 d0                	mov    %edx,%eax
 b58:	5f                   	pop    %edi
 b59:	5d                   	pop    %ebp
 b5a:	c3                   	ret    

00000b5b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 b5b:	b8 01 00 00 00       	mov    $0x1,%eax
 b60:	cd 40                	int    $0x40
 b62:	c3                   	ret    

00000b63 <exit>:
SYSCALL(exit)
 b63:	b8 02 00 00 00       	mov    $0x2,%eax
 b68:	cd 40                	int    $0x40
 b6a:	c3                   	ret    

00000b6b <wait>:
SYSCALL(wait)
 b6b:	b8 03 00 00 00       	mov    $0x3,%eax
 b70:	cd 40                	int    $0x40
 b72:	c3                   	ret    

00000b73 <pipe>:
SYSCALL(pipe)
 b73:	b8 04 00 00 00       	mov    $0x4,%eax
 b78:	cd 40                	int    $0x40
 b7a:	c3                   	ret    

00000b7b <read>:
SYSCALL(read)
 b7b:	b8 05 00 00 00       	mov    $0x5,%eax
 b80:	cd 40                	int    $0x40
 b82:	c3                   	ret    

00000b83 <write>:
SYSCALL(write)
 b83:	b8 10 00 00 00       	mov    $0x10,%eax
 b88:	cd 40                	int    $0x40
 b8a:	c3                   	ret    

00000b8b <close>:
SYSCALL(close)
 b8b:	b8 15 00 00 00       	mov    $0x15,%eax
 b90:	cd 40                	int    $0x40
 b92:	c3                   	ret    

00000b93 <kill>:
SYSCALL(kill)
 b93:	b8 06 00 00 00       	mov    $0x6,%eax
 b98:	cd 40                	int    $0x40
 b9a:	c3                   	ret    

00000b9b <exec>:
SYSCALL(exec)
 b9b:	b8 07 00 00 00       	mov    $0x7,%eax
 ba0:	cd 40                	int    $0x40
 ba2:	c3                   	ret    

00000ba3 <open>:
SYSCALL(open)
 ba3:	b8 0f 00 00 00       	mov    $0xf,%eax
 ba8:	cd 40                	int    $0x40
 baa:	c3                   	ret    

00000bab <mknod>:
SYSCALL(mknod)
 bab:	b8 11 00 00 00       	mov    $0x11,%eax
 bb0:	cd 40                	int    $0x40
 bb2:	c3                   	ret    

00000bb3 <unlink>:
SYSCALL(unlink)
 bb3:	b8 12 00 00 00       	mov    $0x12,%eax
 bb8:	cd 40                	int    $0x40
 bba:	c3                   	ret    

00000bbb <fstat>:
SYSCALL(fstat)
 bbb:	b8 08 00 00 00       	mov    $0x8,%eax
 bc0:	cd 40                	int    $0x40
 bc2:	c3                   	ret    

00000bc3 <link>:
SYSCALL(link)
 bc3:	b8 13 00 00 00       	mov    $0x13,%eax
 bc8:	cd 40                	int    $0x40
 bca:	c3                   	ret    

00000bcb <mkdir>:
SYSCALL(mkdir)
 bcb:	b8 14 00 00 00       	mov    $0x14,%eax
 bd0:	cd 40                	int    $0x40
 bd2:	c3                   	ret    

00000bd3 <chdir>:
SYSCALL(chdir)
 bd3:	b8 09 00 00 00       	mov    $0x9,%eax
 bd8:	cd 40                	int    $0x40
 bda:	c3                   	ret    

00000bdb <dup>:
SYSCALL(dup)
 bdb:	b8 0a 00 00 00       	mov    $0xa,%eax
 be0:	cd 40                	int    $0x40
 be2:	c3                   	ret    

00000be3 <getpid>:
SYSCALL(getpid)
 be3:	b8 0b 00 00 00       	mov    $0xb,%eax
 be8:	cd 40                	int    $0x40
 bea:	c3                   	ret    

00000beb <sbrk>:
SYSCALL(sbrk)
 beb:	b8 0c 00 00 00       	mov    $0xc,%eax
 bf0:	cd 40                	int    $0x40
 bf2:	c3                   	ret    

00000bf3 <sleep>:
SYSCALL(sleep)
 bf3:	b8 0d 00 00 00       	mov    $0xd,%eax
 bf8:	cd 40                	int    $0x40
 bfa:	c3                   	ret    

00000bfb <uptime>:
SYSCALL(uptime)
 bfb:	b8 0e 00 00 00       	mov    $0xe,%eax
 c00:	cd 40                	int    $0x40
 c02:	c3                   	ret    
 c03:	66 90                	xchg   %ax,%ax
 c05:	66 90                	xchg   %ax,%ax
 c07:	66 90                	xchg   %ax,%ax
 c09:	66 90                	xchg   %ax,%ax
 c0b:	66 90                	xchg   %ax,%ax
 c0d:	66 90                	xchg   %ax,%ax
 c0f:	90                   	nop

00000c10 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 c10:	55                   	push   %ebp
 c11:	89 e5                	mov    %esp,%ebp
 c13:	57                   	push   %edi
 c14:	56                   	push   %esi
 c15:	53                   	push   %ebx
 c16:	83 ec 3c             	sub    $0x3c,%esp
 c19:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 c1c:	89 d1                	mov    %edx,%ecx
{
 c1e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 c21:	85 d2                	test   %edx,%edx
 c23:	0f 89 7f 00 00 00    	jns    ca8 <printint+0x98>
 c29:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 c2d:	74 79                	je     ca8 <printint+0x98>
    neg = 1;
 c2f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 c36:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 c38:	31 db                	xor    %ebx,%ebx
 c3a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 c3d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 c40:	89 c8                	mov    %ecx,%eax
 c42:	31 d2                	xor    %edx,%edx
 c44:	89 cf                	mov    %ecx,%edi
 c46:	f7 75 c4             	divl   -0x3c(%ebp)
 c49:	0f b6 92 74 11 00 00 	movzbl 0x1174(%edx),%edx
 c50:	89 45 c0             	mov    %eax,-0x40(%ebp)
 c53:	89 d8                	mov    %ebx,%eax
 c55:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 c58:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 c5b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 c5e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 c61:	76 dd                	jbe    c40 <printint+0x30>
  if(neg)
 c63:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 c66:	85 c9                	test   %ecx,%ecx
 c68:	74 0c                	je     c76 <printint+0x66>
    buf[i++] = '-';
 c6a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 c6f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 c71:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 c76:	8b 7d b8             	mov    -0x48(%ebp),%edi
 c79:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 c7d:	eb 07                	jmp    c86 <printint+0x76>
 c7f:	90                   	nop
    putc(fd, buf[i]);
 c80:	0f b6 13             	movzbl (%ebx),%edx
 c83:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 c86:	83 ec 04             	sub    $0x4,%esp
 c89:	88 55 d7             	mov    %dl,-0x29(%ebp)
 c8c:	6a 01                	push   $0x1
 c8e:	56                   	push   %esi
 c8f:	57                   	push   %edi
 c90:	e8 ee fe ff ff       	call   b83 <write>
  while(--i >= 0)
 c95:	83 c4 10             	add    $0x10,%esp
 c98:	39 de                	cmp    %ebx,%esi
 c9a:	75 e4                	jne    c80 <printint+0x70>
}
 c9c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 c9f:	5b                   	pop    %ebx
 ca0:	5e                   	pop    %esi
 ca1:	5f                   	pop    %edi
 ca2:	5d                   	pop    %ebp
 ca3:	c3                   	ret    
 ca4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 ca8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 caf:	eb 87                	jmp    c38 <printint+0x28>
 cb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 cb8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 cbf:	90                   	nop

00000cc0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 cc0:	55                   	push   %ebp
 cc1:	89 e5                	mov    %esp,%ebp
 cc3:	57                   	push   %edi
 cc4:	56                   	push   %esi
 cc5:	53                   	push   %ebx
 cc6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 cc9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 ccc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 ccf:	0f b6 13             	movzbl (%ebx),%edx
 cd2:	84 d2                	test   %dl,%dl
 cd4:	74 6a                	je     d40 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 cd6:	8d 45 10             	lea    0x10(%ebp),%eax
 cd9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 cdc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 cdf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 ce1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 ce4:	eb 36                	jmp    d1c <printf+0x5c>
 ce6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ced:	8d 76 00             	lea    0x0(%esi),%esi
 cf0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 cf3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 cf8:	83 f8 25             	cmp    $0x25,%eax
 cfb:	74 15                	je     d12 <printf+0x52>
  write(fd, &c, 1);
 cfd:	83 ec 04             	sub    $0x4,%esp
 d00:	88 55 e7             	mov    %dl,-0x19(%ebp)
 d03:	6a 01                	push   $0x1
 d05:	57                   	push   %edi
 d06:	56                   	push   %esi
 d07:	e8 77 fe ff ff       	call   b83 <write>
 d0c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 d0f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 d12:	0f b6 13             	movzbl (%ebx),%edx
 d15:	83 c3 01             	add    $0x1,%ebx
 d18:	84 d2                	test   %dl,%dl
 d1a:	74 24                	je     d40 <printf+0x80>
    c = fmt[i] & 0xff;
 d1c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 d1f:	85 c9                	test   %ecx,%ecx
 d21:	74 cd                	je     cf0 <printf+0x30>
      }
    } else if(state == '%'){
 d23:	83 f9 25             	cmp    $0x25,%ecx
 d26:	75 ea                	jne    d12 <printf+0x52>
      if(c == 'd'){
 d28:	83 f8 25             	cmp    $0x25,%eax
 d2b:	0f 84 07 01 00 00    	je     e38 <printf+0x178>
 d31:	83 e8 63             	sub    $0x63,%eax
 d34:	83 f8 15             	cmp    $0x15,%eax
 d37:	77 17                	ja     d50 <printf+0x90>
 d39:	ff 24 85 1c 11 00 00 	jmp    *0x111c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 d40:	8d 65 f4             	lea    -0xc(%ebp),%esp
 d43:	5b                   	pop    %ebx
 d44:	5e                   	pop    %esi
 d45:	5f                   	pop    %edi
 d46:	5d                   	pop    %ebp
 d47:	c3                   	ret    
 d48:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 d4f:	90                   	nop
  write(fd, &c, 1);
 d50:	83 ec 04             	sub    $0x4,%esp
 d53:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 d56:	6a 01                	push   $0x1
 d58:	57                   	push   %edi
 d59:	56                   	push   %esi
 d5a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 d5e:	e8 20 fe ff ff       	call   b83 <write>
        putc(fd, c);
 d63:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 d67:	83 c4 0c             	add    $0xc,%esp
 d6a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 d6d:	6a 01                	push   $0x1
 d6f:	57                   	push   %edi
 d70:	56                   	push   %esi
 d71:	e8 0d fe ff ff       	call   b83 <write>
        putc(fd, c);
 d76:	83 c4 10             	add    $0x10,%esp
      state = 0;
 d79:	31 c9                	xor    %ecx,%ecx
 d7b:	eb 95                	jmp    d12 <printf+0x52>
 d7d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 d80:	83 ec 0c             	sub    $0xc,%esp
 d83:	b9 10 00 00 00       	mov    $0x10,%ecx
 d88:	6a 00                	push   $0x0
 d8a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 d8d:	8b 10                	mov    (%eax),%edx
 d8f:	89 f0                	mov    %esi,%eax
 d91:	e8 7a fe ff ff       	call   c10 <printint>
        ap++;
 d96:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 d9a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 d9d:	31 c9                	xor    %ecx,%ecx
 d9f:	e9 6e ff ff ff       	jmp    d12 <printf+0x52>
 da4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 da8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 dab:	8b 10                	mov    (%eax),%edx
        ap++;
 dad:	83 c0 04             	add    $0x4,%eax
 db0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 db3:	85 d2                	test   %edx,%edx
 db5:	0f 84 8d 00 00 00    	je     e48 <printf+0x188>
        while(*s != 0){
 dbb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 dbe:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 dc0:	84 c0                	test   %al,%al
 dc2:	0f 84 4a ff ff ff    	je     d12 <printf+0x52>
 dc8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 dcb:	89 d3                	mov    %edx,%ebx
 dcd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 dd0:	83 ec 04             	sub    $0x4,%esp
          s++;
 dd3:	83 c3 01             	add    $0x1,%ebx
 dd6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 dd9:	6a 01                	push   $0x1
 ddb:	57                   	push   %edi
 ddc:	56                   	push   %esi
 ddd:	e8 a1 fd ff ff       	call   b83 <write>
        while(*s != 0){
 de2:	0f b6 03             	movzbl (%ebx),%eax
 de5:	83 c4 10             	add    $0x10,%esp
 de8:	84 c0                	test   %al,%al
 dea:	75 e4                	jne    dd0 <printf+0x110>
      state = 0;
 dec:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 def:	31 c9                	xor    %ecx,%ecx
 df1:	e9 1c ff ff ff       	jmp    d12 <printf+0x52>
 df6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 dfd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 e00:	83 ec 0c             	sub    $0xc,%esp
 e03:	b9 0a 00 00 00       	mov    $0xa,%ecx
 e08:	6a 01                	push   $0x1
 e0a:	e9 7b ff ff ff       	jmp    d8a <printf+0xca>
 e0f:	90                   	nop
        putc(fd, *ap);
 e10:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 e13:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 e16:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 e18:	6a 01                	push   $0x1
 e1a:	57                   	push   %edi
 e1b:	56                   	push   %esi
        putc(fd, *ap);
 e1c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 e1f:	e8 5f fd ff ff       	call   b83 <write>
        ap++;
 e24:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 e28:	83 c4 10             	add    $0x10,%esp
      state = 0;
 e2b:	31 c9                	xor    %ecx,%ecx
 e2d:	e9 e0 fe ff ff       	jmp    d12 <printf+0x52>
 e32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 e38:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 e3b:	83 ec 04             	sub    $0x4,%esp
 e3e:	e9 2a ff ff ff       	jmp    d6d <printf+0xad>
 e43:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 e47:	90                   	nop
          s = "(null)";
 e48:	ba 13 11 00 00       	mov    $0x1113,%edx
        while(*s != 0){
 e4d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 e50:	b8 28 00 00 00       	mov    $0x28,%eax
 e55:	89 d3                	mov    %edx,%ebx
 e57:	e9 74 ff ff ff       	jmp    dd0 <printf+0x110>
 e5c:	66 90                	xchg   %ax,%ax
 e5e:	66 90                	xchg   %ax,%ax

00000e60 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 e60:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 e61:	a1 9c 14 00 00       	mov    0x149c,%eax
{
 e66:	89 e5                	mov    %esp,%ebp
 e68:	57                   	push   %edi
 e69:	56                   	push   %esi
 e6a:	53                   	push   %ebx
 e6b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 e6e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 e71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 e78:	89 c2                	mov    %eax,%edx
 e7a:	8b 00                	mov    (%eax),%eax
 e7c:	39 ca                	cmp    %ecx,%edx
 e7e:	73 30                	jae    eb0 <free+0x50>
 e80:	39 c1                	cmp    %eax,%ecx
 e82:	72 04                	jb     e88 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 e84:	39 c2                	cmp    %eax,%edx
 e86:	72 f0                	jb     e78 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 e88:	8b 73 fc             	mov    -0x4(%ebx),%esi
 e8b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 e8e:	39 f8                	cmp    %edi,%eax
 e90:	74 30                	je     ec2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 e92:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 e95:	8b 42 04             	mov    0x4(%edx),%eax
 e98:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 e9b:	39 f1                	cmp    %esi,%ecx
 e9d:	74 3a                	je     ed9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 e9f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 ea1:	5b                   	pop    %ebx
  freep = p;
 ea2:	89 15 9c 14 00 00    	mov    %edx,0x149c
}
 ea8:	5e                   	pop    %esi
 ea9:	5f                   	pop    %edi
 eaa:	5d                   	pop    %ebp
 eab:	c3                   	ret    
 eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 eb0:	39 c2                	cmp    %eax,%edx
 eb2:	72 c4                	jb     e78 <free+0x18>
 eb4:	39 c1                	cmp    %eax,%ecx
 eb6:	73 c0                	jae    e78 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 eb8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 ebb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 ebe:	39 f8                	cmp    %edi,%eax
 ec0:	75 d0                	jne    e92 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 ec2:	03 70 04             	add    0x4(%eax),%esi
 ec5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 ec8:	8b 02                	mov    (%edx),%eax
 eca:	8b 00                	mov    (%eax),%eax
 ecc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 ecf:	8b 42 04             	mov    0x4(%edx),%eax
 ed2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 ed5:	39 f1                	cmp    %esi,%ecx
 ed7:	75 c6                	jne    e9f <free+0x3f>
    p->s.size += bp->s.size;
 ed9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 edc:	89 15 9c 14 00 00    	mov    %edx,0x149c
    p->s.size += bp->s.size;
 ee2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 ee5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 ee8:	89 0a                	mov    %ecx,(%edx)
}
 eea:	5b                   	pop    %ebx
 eeb:	5e                   	pop    %esi
 eec:	5f                   	pop    %edi
 eed:	5d                   	pop    %ebp
 eee:	c3                   	ret    
 eef:	90                   	nop

00000ef0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ef0:	55                   	push   %ebp
 ef1:	89 e5                	mov    %esp,%ebp
 ef3:	57                   	push   %edi
 ef4:	56                   	push   %esi
 ef5:	53                   	push   %ebx
 ef6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ef9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 efc:	8b 3d 9c 14 00 00    	mov    0x149c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 f02:	8d 70 07             	lea    0x7(%eax),%esi
 f05:	c1 ee 03             	shr    $0x3,%esi
 f08:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 f0b:	85 ff                	test   %edi,%edi
 f0d:	0f 84 9d 00 00 00    	je     fb0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 f13:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 f15:	8b 4a 04             	mov    0x4(%edx),%ecx
 f18:	39 f1                	cmp    %esi,%ecx
 f1a:	73 6a                	jae    f86 <malloc+0x96>
 f1c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 f21:	39 de                	cmp    %ebx,%esi
 f23:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 f26:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 f2d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 f30:	eb 17                	jmp    f49 <malloc+0x59>
 f32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 f38:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 f3a:	8b 48 04             	mov    0x4(%eax),%ecx
 f3d:	39 f1                	cmp    %esi,%ecx
 f3f:	73 4f                	jae    f90 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 f41:	8b 3d 9c 14 00 00    	mov    0x149c,%edi
 f47:	89 c2                	mov    %eax,%edx
 f49:	39 d7                	cmp    %edx,%edi
 f4b:	75 eb                	jne    f38 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 f4d:	83 ec 0c             	sub    $0xc,%esp
 f50:	ff 75 e4             	push   -0x1c(%ebp)
 f53:	e8 93 fc ff ff       	call   beb <sbrk>
  if(p == (char*)-1)
 f58:	83 c4 10             	add    $0x10,%esp
 f5b:	83 f8 ff             	cmp    $0xffffffff,%eax
 f5e:	74 1c                	je     f7c <malloc+0x8c>
  hp->s.size = nu;
 f60:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 f63:	83 ec 0c             	sub    $0xc,%esp
 f66:	83 c0 08             	add    $0x8,%eax
 f69:	50                   	push   %eax
 f6a:	e8 f1 fe ff ff       	call   e60 <free>
  return freep;
 f6f:	8b 15 9c 14 00 00    	mov    0x149c,%edx
      if((p = morecore(nunits)) == 0)
 f75:	83 c4 10             	add    $0x10,%esp
 f78:	85 d2                	test   %edx,%edx
 f7a:	75 bc                	jne    f38 <malloc+0x48>
        return 0;
  }
}
 f7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 f7f:	31 c0                	xor    %eax,%eax
}
 f81:	5b                   	pop    %ebx
 f82:	5e                   	pop    %esi
 f83:	5f                   	pop    %edi
 f84:	5d                   	pop    %ebp
 f85:	c3                   	ret    
    if(p->s.size >= nunits){
 f86:	89 d0                	mov    %edx,%eax
 f88:	89 fa                	mov    %edi,%edx
 f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 f90:	39 ce                	cmp    %ecx,%esi
 f92:	74 4c                	je     fe0 <malloc+0xf0>
        p->s.size -= nunits;
 f94:	29 f1                	sub    %esi,%ecx
 f96:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 f99:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 f9c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 f9f:	89 15 9c 14 00 00    	mov    %edx,0x149c
}
 fa5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 fa8:	83 c0 08             	add    $0x8,%eax
}
 fab:	5b                   	pop    %ebx
 fac:	5e                   	pop    %esi
 fad:	5f                   	pop    %edi
 fae:	5d                   	pop    %ebp
 faf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 fb0:	c7 05 9c 14 00 00 a0 	movl   $0x14a0,0x149c
 fb7:	14 00 00 
    base.s.size = 0;
 fba:	bf a0 14 00 00       	mov    $0x14a0,%edi
    base.s.ptr = freep = prevp = &base;
 fbf:	c7 05 a0 14 00 00 a0 	movl   $0x14a0,0x14a0
 fc6:	14 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 fc9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 fcb:	c7 05 a4 14 00 00 00 	movl   $0x0,0x14a4
 fd2:	00 00 00 
    if(p->s.size >= nunits){
 fd5:	e9 42 ff ff ff       	jmp    f1c <malloc+0x2c>
 fda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 fe0:	8b 08                	mov    (%eax),%ecx
 fe2:	89 0a                	mov    %ecx,(%edx)
 fe4:	eb b9                	jmp    f9f <malloc+0xaf>
