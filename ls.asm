
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
}

int
main(int argc, char *argv[])
{
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
  15:	83 ec 20             	sub    $0x20,%esp
  18:	8b 11                	mov    (%ecx),%edx
  1a:	8b 71 04             	mov    0x4(%ecx),%esi
  int i;
  int showHidden = 0;

  if (strcmp(argv[argc-1], "-a") == 0) {
  1d:	68 a0 0b 00 00       	push   $0xba0
  22:	8d 82 ff ff ff 3f    	lea    0x3fffffff(%edx),%eax
  28:	89 55 e0             	mov    %edx,-0x20(%ebp)
  2b:	ff 34 86             	push   (%esi,%eax,4)
  2e:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  35:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  38:	e8 23 04 00 00       	call   460 <strcmp>
  3d:	83 c4 10             	add    $0x10,%esp
  40:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  43:	8b 55 e0             	mov    -0x20(%ebp),%edx
  46:	85 c0                	test   %eax,%eax
  48:	74 31                	je     7b <main+0x7b>
  4a:	83 c1 04             	add    $0x4,%ecx
  int showHidden = 0;
  4d:	31 ff                	xor    %edi,%edi
    showHidden = 1;
    argc--;
  }
  if(argc < 2){
  4f:	8d 5e 04             	lea    0x4(%esi),%ebx
  52:	01 ce                	add    %ecx,%esi
  54:	83 fa 01             	cmp    $0x1,%edx
  57:	7e 2c                	jle    85 <main+0x85>
  59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ls(".", showHidden);
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i], showHidden);
  60:	83 ec 08             	sub    $0x8,%esp
  63:	83 c3 04             	add    $0x4,%ebx
  66:	57                   	push   %edi
  67:	ff 73 fc             	push   -0x4(%ebx)
  6a:	e8 91 01 00 00       	call   200 <ls>
  for(i=1; i<argc; i++)
  6f:	83 c4 10             	add    $0x10,%esp
  72:	39 f3                	cmp    %esi,%ebx
  74:	75 ea                	jne    60 <main+0x60>
  exit();
  76:	e8 18 06 00 00       	call   693 <exit>
    argc--;
  7b:	83 ea 01             	sub    $0x1,%edx
    showHidden = 1;
  7e:	bf 01 00 00 00       	mov    $0x1,%edi
  83:	eb ca                	jmp    4f <main+0x4f>
    ls(".", showHidden);
  85:	50                   	push   %eax
  86:	50                   	push   %eax
  87:	57                   	push   %edi
  88:	68 a3 0b 00 00       	push   $0xba3
  8d:	e8 6e 01 00 00       	call   200 <ls>
    exit();
  92:	e8 fc 05 00 00       	call   693 <exit>
  97:	66 90                	xchg   %ax,%ax
  99:	66 90                	xchg   %ax,%ax
  9b:	66 90                	xchg   %ax,%ax
  9d:	66 90                	xchg   %ax,%ax
  9f:	90                   	nop

000000a0 <fmtname>:
{
  a0:	f3 0f 1e fb          	endbr32
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	57                   	push   %edi
  a8:	56                   	push   %esi
  a9:	53                   	push   %ebx
  aa:	83 ec 18             	sub    $0x18,%esp
  ad:	8b 7d 08             	mov    0x8(%ebp),%edi
  b0:	8b 75 0c             	mov    0xc(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  b3:	57                   	push   %edi
  b4:	e8 f7 03 00 00       	call   4b0 <strlen>
  b9:	83 c4 10             	add    $0x10,%esp
  bc:	01 f8                	add    %edi,%eax
  be:	89 c3                	mov    %eax,%ebx
  c0:	73 0f                	jae    d1 <fmtname+0x31>
  c2:	eb 12                	jmp    d6 <fmtname+0x36>
  c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  c8:	8d 43 ff             	lea    -0x1(%ebx),%eax
  cb:	39 c7                	cmp    %eax,%edi
  cd:	77 0a                	ja     d9 <fmtname+0x39>
  cf:	89 c3                	mov    %eax,%ebx
  d1:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  d4:	75 f2                	jne    c8 <fmtname+0x28>
  d6:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ){
  d9:	83 ec 0c             	sub    $0xc,%esp
  dc:	53                   	push   %ebx
  dd:	e8 ce 03 00 00       	call   4b0 <strlen>
  e2:	83 c4 10             	add    $0x10,%esp
  e5:	83 f8 0d             	cmp    $0xd,%eax
  e8:	76 16                	jbe    100 <fmtname+0x60>
    if(type == T_DIR){
  ea:	66 83 fe 01          	cmp    $0x1,%si
  ee:	74 50                	je     140 <fmtname+0xa0>
}
  f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  f3:	89 d8                	mov    %ebx,%eax
  f5:	5b                   	pop    %ebx
  f6:	5e                   	pop    %esi
  f7:	5f                   	pop    %edi
  f8:	5d                   	pop    %ebp
  f9:	c3                   	ret
  fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  memmove(buf, p, strlen(p));
 100:	83 ec 0c             	sub    $0xc,%esp
 103:	53                   	push   %ebx
 104:	e8 a7 03 00 00       	call   4b0 <strlen>
 109:	83 c4 0c             	add    $0xc,%esp
 10c:	50                   	push   %eax
 10d:	53                   	push   %ebx
 10e:	68 fc 0e 00 00       	push   $0xefc
 113:	e8 48 05 00 00       	call   660 <memmove>
  if(type == T_FILE){
 118:	83 c4 10             	add    $0x10,%esp
 11b:	66 83 fe 02          	cmp    $0x2,%si
 11f:	74 47                	je     168 <fmtname+0xc8>
  else if(type == T_DIR){
 121:	66 83 fe 01          	cmp    $0x1,%si
 125:	74 79                	je     1a0 <fmtname+0x100>
}
 127:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return buf;
 12a:	bb fc 0e 00 00       	mov    $0xefc,%ebx
}
 12f:	89 d8                	mov    %ebx,%eax
 131:	5b                   	pop    %ebx
 132:	5e                   	pop    %esi
 133:	5f                   	pop    %edi
 134:	5d                   	pop    %ebp
 135:	c3                   	ret
 136:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 13d:	00 
 13e:	66 90                	xchg   %ax,%ax
      memset(p+strlen(p), '/', 1);
 140:	83 ec 0c             	sub    $0xc,%esp
 143:	53                   	push   %ebx
 144:	e8 67 03 00 00       	call   4b0 <strlen>
 149:	83 c4 0c             	add    $0xc,%esp
 14c:	01 d8                	add    %ebx,%eax
 14e:	6a 01                	push   $0x1
 150:	6a 2f                	push   $0x2f
 152:	50                   	push   %eax
 153:	e8 98 03 00 00       	call   4f0 <memset>
 158:	83 c4 10             	add    $0x10,%esp
}
 15b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 15e:	89 d8                	mov    %ebx,%eax
 160:	5b                   	pop    %ebx
 161:	5e                   	pop    %esi
 162:	5f                   	pop    %edi
 163:	5d                   	pop    %ebp
 164:	c3                   	ret
 165:	8d 76 00             	lea    0x0(%esi),%esi
    memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 168:	83 ec 0c             	sub    $0xc,%esp
 16b:	53                   	push   %ebx
 16c:	e8 3f 03 00 00       	call   4b0 <strlen>
 171:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
 174:	bb fc 0e 00 00       	mov    $0xefc,%ebx
    memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 179:	89 c6                	mov    %eax,%esi
 17b:	e8 30 03 00 00       	call   4b0 <strlen>
 180:	ba 0e 00 00 00       	mov    $0xe,%edx
 185:	83 c4 0c             	add    $0xc,%esp
 188:	29 f2                	sub    %esi,%edx
 18a:	05 fc 0e 00 00       	add    $0xefc,%eax
 18f:	52                   	push   %edx
 190:	6a 20                	push   $0x20
 192:	50                   	push   %eax
 193:	e8 58 03 00 00       	call   4f0 <memset>
 198:	83 c4 10             	add    $0x10,%esp
 19b:	e9 50 ff ff ff       	jmp    f0 <fmtname+0x50>
    memset(buf+strlen(p), '/', 1);
 1a0:	83 ec 0c             	sub    $0xc,%esp
 1a3:	53                   	push   %ebx
 1a4:	e8 07 03 00 00       	call   4b0 <strlen>
 1a9:	83 c4 0c             	add    $0xc,%esp
 1ac:	05 fc 0e 00 00       	add    $0xefc,%eax
 1b1:	6a 01                	push   $0x1
 1b3:	6a 2f                	push   $0x2f
 1b5:	50                   	push   %eax
 1b6:	e8 35 03 00 00       	call   4f0 <memset>
    memset(buf+strlen(p)+1, ' ', DIRSIZ-strlen(p)+1);
 1bb:	89 1c 24             	mov    %ebx,(%esp)
 1be:	e8 ed 02 00 00       	call   4b0 <strlen>
 1c3:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
 1c6:	bb fc 0e 00 00       	mov    $0xefc,%ebx
    memset(buf+strlen(p)+1, ' ', DIRSIZ-strlen(p)+1);
 1cb:	89 c6                	mov    %eax,%esi
 1cd:	e8 de 02 00 00       	call   4b0 <strlen>
 1d2:	ba 0f 00 00 00       	mov    $0xf,%edx
 1d7:	83 c4 0c             	add    $0xc,%esp
 1da:	29 f2                	sub    %esi,%edx
 1dc:	05 fd 0e 00 00       	add    $0xefd,%eax
 1e1:	52                   	push   %edx
 1e2:	6a 20                	push   $0x20
 1e4:	50                   	push   %eax
 1e5:	e8 06 03 00 00       	call   4f0 <memset>
 1ea:	83 c4 10             	add    $0x10,%esp
 1ed:	e9 fe fe ff ff       	jmp    f0 <fmtname+0x50>
 1f2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1f9:	00 
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000200 <ls>:
{
 200:	f3 0f 1e fb          	endbr32
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	57                   	push   %edi
 208:	56                   	push   %esi
 209:	53                   	push   %ebx
 20a:	81 ec 54 02 00 00    	sub    $0x254,%esp
 210:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 213:	6a 00                	push   $0x0
 215:	57                   	push   %edi
 216:	e8 b8 04 00 00       	call   6d3 <open>
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	85 c0                	test   %eax,%eax
 220:	0f 88 8a 01 00 00    	js     3b0 <ls+0x1b0>
  if(fstat(fd, &st) < 0){
 226:	83 ec 08             	sub    $0x8,%esp
 229:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 22f:	89 c3                	mov    %eax,%ebx
 231:	56                   	push   %esi
 232:	50                   	push   %eax
 233:	e8 b3 04 00 00       	call   6eb <fstat>
 238:	83 c4 10             	add    $0x10,%esp
 23b:	85 c0                	test   %eax,%eax
 23d:	0f 88 ad 01 00 00    	js     3f0 <ls+0x1f0>
  switch(st.type){
 243:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 24a:	66 83 f8 01          	cmp    $0x1,%ax
 24e:	74 60                	je     2b0 <ls+0xb0>
 250:	66 83 f8 02          	cmp    $0x2,%ax
 254:	74 1a                	je     270 <ls+0x70>
  close(fd);
 256:	83 ec 0c             	sub    $0xc,%esp
 259:	53                   	push   %ebx
 25a:	e8 5c 04 00 00       	call   6bb <close>
 25f:	83 c4 10             	add    $0x10,%esp
}
 262:	8d 65 f4             	lea    -0xc(%ebp),%esp
 265:	5b                   	pop    %ebx
 266:	5e                   	pop    %esi
 267:	5f                   	pop    %edi
 268:	5d                   	pop    %ebp
 269:	c3                   	ret
 26a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path, st.type), st.type, st.ino, st.size);
 270:	83 ec 08             	sub    $0x8,%esp
 273:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 279:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 27f:	6a 02                	push   $0x2
 281:	57                   	push   %edi
 282:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 288:	e8 13 fe ff ff       	call   a0 <fmtname>
 28d:	5a                   	pop    %edx
 28e:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 294:	59                   	pop    %ecx
 295:	52                   	push   %edx
 296:	56                   	push   %esi
 297:	6a 02                	push   $0x2
 299:	50                   	push   %eax
 29a:	68 80 0b 00 00       	push   $0xb80
 29f:	6a 01                	push   $0x1
 2a1:	e8 4a 05 00 00       	call   7f0 <printf>
    break;
 2a6:	83 c4 20             	add    $0x20,%esp
 2a9:	eb ab                	jmp    256 <ls+0x56>
 2ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 2b0:	83 ec 0c             	sub    $0xc,%esp
 2b3:	57                   	push   %edi
 2b4:	e8 f7 01 00 00       	call   4b0 <strlen>
 2b9:	83 c4 10             	add    $0x10,%esp
 2bc:	83 c0 10             	add    $0x10,%eax
 2bf:	3d 00 02 00 00       	cmp    $0x200,%eax
 2c4:	0f 87 06 01 00 00    	ja     3d0 <ls+0x1d0>
    strcpy(buf, path);
 2ca:	83 ec 08             	sub    $0x8,%esp
 2cd:	57                   	push   %edi
 2ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 2d4:	57                   	push   %edi
 2d5:	e8 56 01 00 00       	call   430 <strcpy>
    p = buf+strlen(buf);
 2da:	89 3c 24             	mov    %edi,(%esp)
 2dd:	e8 ce 01 00 00       	call   4b0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 2e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 2e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 2ea:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
    *p++ = '/';
 2f0:	89 8d b0 fd ff ff    	mov    %ecx,-0x250(%ebp)
 2f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 300:	83 ec 04             	sub    $0x4,%esp
 303:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 309:	6a 10                	push   $0x10
 30b:	50                   	push   %eax
 30c:	53                   	push   %ebx
 30d:	e8 99 03 00 00       	call   6ab <read>
 312:	83 c4 10             	add    $0x10,%esp
 315:	83 f8 10             	cmp    $0x10,%eax
 318:	0f 85 38 ff ff ff    	jne    256 <ls+0x56>
      if(de.inum == 0)
 31e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 325:	00 
 326:	74 d8                	je     300 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 328:	83 ec 04             	sub    $0x4,%esp
 32b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 331:	6a 0e                	push   $0xe
 333:	50                   	push   %eax
 334:	ff b5 b0 fd ff ff    	push   -0x250(%ebp)
 33a:	e8 21 03 00 00       	call   660 <memmove>
      p[DIRSIZ] = 0;
 33f:	8b 85 b4 fd ff ff    	mov    -0x24c(%ebp),%eax
 345:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 349:	59                   	pop    %ecx
 34a:	58                   	pop    %eax
 34b:	56                   	push   %esi
 34c:	57                   	push   %edi
 34d:	e8 7e 02 00 00       	call   5d0 <stat>
 352:	83 c4 10             	add    $0x10,%esp
 355:	85 c0                	test   %eax,%eax
 357:	0f 88 bb 00 00 00    	js     418 <ls+0x218>
        char *filename = fmtname(buf, st.type);
 35d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 364:	83 ec 08             	sub    $0x8,%esp
 367:	50                   	push   %eax
 368:	57                   	push   %edi
 369:	e8 32 fd ff ff       	call   a0 <fmtname>
        if (showHidden || *filename != '.')
 36e:	8b 55 0c             	mov    0xc(%ebp),%edx
 371:	83 c4 10             	add    $0x10,%esp
 374:	85 d2                	test   %edx,%edx
 376:	75 05                	jne    37d <ls+0x17d>
 378:	80 38 2e             	cmpb   $0x2e,(%eax)
 37b:	74 83                	je     300 <ls+0x100>
          printf(1, "%s %d %d %d\n", filename, st.type, st.ino, st.size);
 37d:	0f bf 95 d4 fd ff ff 	movswl -0x22c(%ebp),%edx
 384:	83 ec 08             	sub    $0x8,%esp
 387:	ff b5 e4 fd ff ff    	push   -0x21c(%ebp)
 38d:	ff b5 dc fd ff ff    	push   -0x224(%ebp)
 393:	52                   	push   %edx
 394:	50                   	push   %eax
 395:	68 80 0b 00 00       	push   $0xb80
 39a:	6a 01                	push   $0x1
 39c:	e8 4f 04 00 00       	call   7f0 <printf>
 3a1:	83 c4 20             	add    $0x20,%esp
 3a4:	e9 57 ff ff ff       	jmp    300 <ls+0x100>
 3a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "ls: cannot open %s\n", path);
 3b0:	83 ec 04             	sub    $0x4,%esp
 3b3:	57                   	push   %edi
 3b4:	68 58 0b 00 00       	push   $0xb58
 3b9:	6a 02                	push   $0x2
 3bb:	e8 30 04 00 00       	call   7f0 <printf>
    return;
 3c0:	83 c4 10             	add    $0x10,%esp
}
 3c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3c6:	5b                   	pop    %ebx
 3c7:	5e                   	pop    %esi
 3c8:	5f                   	pop    %edi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret
 3cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      printf(1, "ls: path too long\n");
 3d0:	83 ec 08             	sub    $0x8,%esp
 3d3:	68 8d 0b 00 00       	push   $0xb8d
 3d8:	6a 01                	push   $0x1
 3da:	e8 11 04 00 00       	call   7f0 <printf>
      break;
 3df:	83 c4 10             	add    $0x10,%esp
 3e2:	e9 6f fe ff ff       	jmp    256 <ls+0x56>
 3e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ee:	00 
 3ef:	90                   	nop
    printf(2, "ls: cannot stat %s\n", path);
 3f0:	83 ec 04             	sub    $0x4,%esp
 3f3:	57                   	push   %edi
 3f4:	68 6c 0b 00 00       	push   $0xb6c
 3f9:	6a 02                	push   $0x2
 3fb:	e8 f0 03 00 00       	call   7f0 <printf>
    close(fd);
 400:	89 1c 24             	mov    %ebx,(%esp)
 403:	e8 b3 02 00 00       	call   6bb <close>
    return;
 408:	83 c4 10             	add    $0x10,%esp
}
 40b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 40e:	5b                   	pop    %ebx
 40f:	5e                   	pop    %esi
 410:	5f                   	pop    %edi
 411:	5d                   	pop    %ebp
 412:	c3                   	ret
 413:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(1, "ls: cannot stat %s\n", buf);
 418:	83 ec 04             	sub    $0x4,%esp
 41b:	57                   	push   %edi
 41c:	68 6c 0b 00 00       	push   $0xb6c
 421:	6a 01                	push   $0x1
 423:	e8 c8 03 00 00       	call   7f0 <printf>
        continue;
 428:	83 c4 10             	add    $0x10,%esp
 42b:	e9 d0 fe ff ff       	jmp    300 <ls+0x100>

00000430 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 430:	f3 0f 1e fb          	endbr32
 434:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 435:	31 c0                	xor    %eax,%eax
{
 437:	89 e5                	mov    %esp,%ebp
 439:	53                   	push   %ebx
 43a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 43d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 440:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 444:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 447:	83 c0 01             	add    $0x1,%eax
 44a:	84 d2                	test   %dl,%dl
 44c:	75 f2                	jne    440 <strcpy+0x10>
    ;
  return os;
}
 44e:	89 c8                	mov    %ecx,%eax
 450:	5b                   	pop    %ebx
 451:	5d                   	pop    %ebp
 452:	c3                   	ret
 453:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 45a:	00 
 45b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000460 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 460:	f3 0f 1e fb          	endbr32
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	53                   	push   %ebx
 468:	8b 4d 08             	mov    0x8(%ebp),%ecx
 46b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 46e:	0f b6 01             	movzbl (%ecx),%eax
 471:	0f b6 1a             	movzbl (%edx),%ebx
 474:	84 c0                	test   %al,%al
 476:	75 19                	jne    491 <strcmp+0x31>
 478:	eb 26                	jmp    4a0 <strcmp+0x40>
 47a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 480:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 484:	83 c1 01             	add    $0x1,%ecx
 487:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 48a:	0f b6 1a             	movzbl (%edx),%ebx
 48d:	84 c0                	test   %al,%al
 48f:	74 0f                	je     4a0 <strcmp+0x40>
 491:	38 d8                	cmp    %bl,%al
 493:	74 eb                	je     480 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 495:	29 d8                	sub    %ebx,%eax
}
 497:	5b                   	pop    %ebx
 498:	5d                   	pop    %ebp
 499:	c3                   	ret
 49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 4a2:	29 d8                	sub    %ebx,%eax
}
 4a4:	5b                   	pop    %ebx
 4a5:	5d                   	pop    %ebp
 4a6:	c3                   	ret
 4a7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4ae:	00 
 4af:	90                   	nop

000004b0 <strlen>:

uint
strlen(const char *s)
{
 4b0:	f3 0f 1e fb          	endbr32
 4b4:	55                   	push   %ebp
 4b5:	89 e5                	mov    %esp,%ebp
 4b7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 4ba:	80 3a 00             	cmpb   $0x0,(%edx)
 4bd:	74 21                	je     4e0 <strlen+0x30>
 4bf:	31 c0                	xor    %eax,%eax
 4c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4c8:	83 c0 01             	add    $0x1,%eax
 4cb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 4cf:	89 c1                	mov    %eax,%ecx
 4d1:	75 f5                	jne    4c8 <strlen+0x18>
    ;
  return n;
}
 4d3:	89 c8                	mov    %ecx,%eax
 4d5:	5d                   	pop    %ebp
 4d6:	c3                   	ret
 4d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4de:	00 
 4df:	90                   	nop
  for(n = 0; s[n]; n++)
 4e0:	31 c9                	xor    %ecx,%ecx
}
 4e2:	5d                   	pop    %ebp
 4e3:	89 c8                	mov    %ecx,%eax
 4e5:	c3                   	ret
 4e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4ed:	00 
 4ee:	66 90                	xchg   %ax,%ax

000004f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4f0:	f3 0f 1e fb          	endbr32
 4f4:	55                   	push   %ebp
 4f5:	89 e5                	mov    %esp,%ebp
 4f7:	57                   	push   %edi
 4f8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4fb:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 501:	89 d7                	mov    %edx,%edi
 503:	fc                   	cld
 504:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 506:	89 d0                	mov    %edx,%eax
 508:	5f                   	pop    %edi
 509:	5d                   	pop    %ebp
 50a:	c3                   	ret
 50b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000510 <strchr>:

char*
strchr(const char *s, char c)
{
 510:	f3 0f 1e fb          	endbr32
 514:	55                   	push   %ebp
 515:	89 e5                	mov    %esp,%ebp
 517:	8b 45 08             	mov    0x8(%ebp),%eax
 51a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 51e:	0f b6 10             	movzbl (%eax),%edx
 521:	84 d2                	test   %dl,%dl
 523:	75 16                	jne    53b <strchr+0x2b>
 525:	eb 21                	jmp    548 <strchr+0x38>
 527:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 52e:	00 
 52f:	90                   	nop
 530:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 534:	83 c0 01             	add    $0x1,%eax
 537:	84 d2                	test   %dl,%dl
 539:	74 0d                	je     548 <strchr+0x38>
    if(*s == c)
 53b:	38 d1                	cmp    %dl,%cl
 53d:	75 f1                	jne    530 <strchr+0x20>
      return (char*)s;
  return 0;
}
 53f:	5d                   	pop    %ebp
 540:	c3                   	ret
 541:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 548:	31 c0                	xor    %eax,%eax
}
 54a:	5d                   	pop    %ebp
 54b:	c3                   	ret
 54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000550 <gets>:

char*
gets(char *buf, int max)
{
 550:	f3 0f 1e fb          	endbr32
 554:	55                   	push   %ebp
 555:	89 e5                	mov    %esp,%ebp
 557:	57                   	push   %edi
 558:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 559:	31 f6                	xor    %esi,%esi
{
 55b:	53                   	push   %ebx
 55c:	89 f3                	mov    %esi,%ebx
 55e:	83 ec 1c             	sub    $0x1c,%esp
 561:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 564:	eb 33                	jmp    599 <gets+0x49>
 566:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 56d:	00 
 56e:	66 90                	xchg   %ax,%ax
    cc = read(0, &c, 1);
 570:	83 ec 04             	sub    $0x4,%esp
 573:	8d 45 e7             	lea    -0x19(%ebp),%eax
 576:	6a 01                	push   $0x1
 578:	50                   	push   %eax
 579:	6a 00                	push   $0x0
 57b:	e8 2b 01 00 00       	call   6ab <read>
    if(cc < 1)
 580:	83 c4 10             	add    $0x10,%esp
 583:	85 c0                	test   %eax,%eax
 585:	7e 1c                	jle    5a3 <gets+0x53>
      break;
    buf[i++] = c;
 587:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 58b:	83 c7 01             	add    $0x1,%edi
 58e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 591:	3c 0a                	cmp    $0xa,%al
 593:	74 23                	je     5b8 <gets+0x68>
 595:	3c 0d                	cmp    $0xd,%al
 597:	74 1f                	je     5b8 <gets+0x68>
  for(i=0; i+1 < max; ){
 599:	83 c3 01             	add    $0x1,%ebx
 59c:	89 fe                	mov    %edi,%esi
 59e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5a1:	7c cd                	jl     570 <gets+0x20>
 5a3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 5a5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 5a8:	c6 03 00             	movb   $0x0,(%ebx)
}
 5ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ae:	5b                   	pop    %ebx
 5af:	5e                   	pop    %esi
 5b0:	5f                   	pop    %edi
 5b1:	5d                   	pop    %ebp
 5b2:	c3                   	ret
 5b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 5b8:	8b 75 08             	mov    0x8(%ebp),%esi
 5bb:	8b 45 08             	mov    0x8(%ebp),%eax
 5be:	01 de                	add    %ebx,%esi
 5c0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 5c2:	c6 03 00             	movb   $0x0,(%ebx)
}
 5c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5c8:	5b                   	pop    %ebx
 5c9:	5e                   	pop    %esi
 5ca:	5f                   	pop    %edi
 5cb:	5d                   	pop    %ebp
 5cc:	c3                   	ret
 5cd:	8d 76 00             	lea    0x0(%esi),%esi

000005d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 5d0:	f3 0f 1e fb          	endbr32
 5d4:	55                   	push   %ebp
 5d5:	89 e5                	mov    %esp,%ebp
 5d7:	56                   	push   %esi
 5d8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5d9:	83 ec 08             	sub    $0x8,%esp
 5dc:	6a 00                	push   $0x0
 5de:	ff 75 08             	push   0x8(%ebp)
 5e1:	e8 ed 00 00 00       	call   6d3 <open>
  if(fd < 0)
 5e6:	83 c4 10             	add    $0x10,%esp
 5e9:	85 c0                	test   %eax,%eax
 5eb:	78 2b                	js     618 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 5ed:	83 ec 08             	sub    $0x8,%esp
 5f0:	ff 75 0c             	push   0xc(%ebp)
 5f3:	89 c3                	mov    %eax,%ebx
 5f5:	50                   	push   %eax
 5f6:	e8 f0 00 00 00       	call   6eb <fstat>
  close(fd);
 5fb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 5fe:	89 c6                	mov    %eax,%esi
  close(fd);
 600:	e8 b6 00 00 00       	call   6bb <close>
  return r;
 605:	83 c4 10             	add    $0x10,%esp
}
 608:	8d 65 f8             	lea    -0x8(%ebp),%esp
 60b:	89 f0                	mov    %esi,%eax
 60d:	5b                   	pop    %ebx
 60e:	5e                   	pop    %esi
 60f:	5d                   	pop    %ebp
 610:	c3                   	ret
 611:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 618:	be ff ff ff ff       	mov    $0xffffffff,%esi
 61d:	eb e9                	jmp    608 <stat+0x38>
 61f:	90                   	nop

00000620 <atoi>:

int
atoi(const char *s)
{
 620:	f3 0f 1e fb          	endbr32
 624:	55                   	push   %ebp
 625:	89 e5                	mov    %esp,%ebp
 627:	53                   	push   %ebx
 628:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 62b:	0f be 02             	movsbl (%edx),%eax
 62e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 631:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 634:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 639:	77 1a                	ja     655 <atoi+0x35>
 63b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 640:	83 c2 01             	add    $0x1,%edx
 643:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 646:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 64a:	0f be 02             	movsbl (%edx),%eax
 64d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 650:	80 fb 09             	cmp    $0x9,%bl
 653:	76 eb                	jbe    640 <atoi+0x20>
  return n;
}
 655:	89 c8                	mov    %ecx,%eax
 657:	5b                   	pop    %ebx
 658:	5d                   	pop    %ebp
 659:	c3                   	ret
 65a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000660 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 660:	f3 0f 1e fb          	endbr32
 664:	55                   	push   %ebp
 665:	89 e5                	mov    %esp,%ebp
 667:	57                   	push   %edi
 668:	8b 45 10             	mov    0x10(%ebp),%eax
 66b:	8b 55 08             	mov    0x8(%ebp),%edx
 66e:	56                   	push   %esi
 66f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 672:	85 c0                	test   %eax,%eax
 674:	7e 0f                	jle    685 <memmove+0x25>
 676:	01 d0                	add    %edx,%eax
  dst = vdst;
 678:	89 d7                	mov    %edx,%edi
 67a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 680:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 681:	39 f8                	cmp    %edi,%eax
 683:	75 fb                	jne    680 <memmove+0x20>
  return vdst;
}
 685:	5e                   	pop    %esi
 686:	89 d0                	mov    %edx,%eax
 688:	5f                   	pop    %edi
 689:	5d                   	pop    %ebp
 68a:	c3                   	ret

0000068b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 68b:	b8 01 00 00 00       	mov    $0x1,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret

00000693 <exit>:
SYSCALL(exit)
 693:	b8 02 00 00 00       	mov    $0x2,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret

0000069b <wait>:
SYSCALL(wait)
 69b:	b8 03 00 00 00       	mov    $0x3,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret

000006a3 <pipe>:
SYSCALL(pipe)
 6a3:	b8 04 00 00 00       	mov    $0x4,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret

000006ab <read>:
SYSCALL(read)
 6ab:	b8 05 00 00 00       	mov    $0x5,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret

000006b3 <write>:
SYSCALL(write)
 6b3:	b8 10 00 00 00       	mov    $0x10,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret

000006bb <close>:
SYSCALL(close)
 6bb:	b8 15 00 00 00       	mov    $0x15,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret

000006c3 <kill>:
SYSCALL(kill)
 6c3:	b8 06 00 00 00       	mov    $0x6,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret

000006cb <exec>:
SYSCALL(exec)
 6cb:	b8 07 00 00 00       	mov    $0x7,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret

000006d3 <open>:
SYSCALL(open)
 6d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret

000006db <mknod>:
SYSCALL(mknod)
 6db:	b8 11 00 00 00       	mov    $0x11,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret

000006e3 <unlink>:
SYSCALL(unlink)
 6e3:	b8 12 00 00 00       	mov    $0x12,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret

000006eb <fstat>:
SYSCALL(fstat)
 6eb:	b8 08 00 00 00       	mov    $0x8,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret

000006f3 <link>:
SYSCALL(link)
 6f3:	b8 13 00 00 00       	mov    $0x13,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret

000006fb <mkdir>:
SYSCALL(mkdir)
 6fb:	b8 14 00 00 00       	mov    $0x14,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret

00000703 <chdir>:
SYSCALL(chdir)
 703:	b8 09 00 00 00       	mov    $0x9,%eax
 708:	cd 40                	int    $0x40
 70a:	c3                   	ret

0000070b <dup>:
SYSCALL(dup)
 70b:	b8 0a 00 00 00       	mov    $0xa,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret

00000713 <getpid>:
SYSCALL(getpid)
 713:	b8 0b 00 00 00       	mov    $0xb,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret

0000071b <sbrk>:
SYSCALL(sbrk)
 71b:	b8 0c 00 00 00       	mov    $0xc,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret

00000723 <sleep>:
SYSCALL(sleep)
 723:	b8 0d 00 00 00       	mov    $0xd,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret

0000072b <uptime>:
SYSCALL(uptime)
 72b:	b8 0e 00 00 00       	mov    $0xe,%eax
 730:	cd 40                	int    $0x40
 732:	c3                   	ret
 733:	66 90                	xchg   %ax,%ax
 735:	66 90                	xchg   %ax,%ax
 737:	66 90                	xchg   %ax,%ax
 739:	66 90                	xchg   %ax,%ax
 73b:	66 90                	xchg   %ax,%ax
 73d:	66 90                	xchg   %ax,%ax
 73f:	90                   	nop

00000740 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	57                   	push   %edi
 744:	56                   	push   %esi
 745:	53                   	push   %ebx
 746:	83 ec 3c             	sub    $0x3c,%esp
 749:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 74c:	89 d1                	mov    %edx,%ecx
{
 74e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 751:	85 d2                	test   %edx,%edx
 753:	0f 89 7f 00 00 00    	jns    7d8 <printint+0x98>
 759:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 75d:	74 79                	je     7d8 <printint+0x98>
    neg = 1;
 75f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 766:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 768:	31 db                	xor    %ebx,%ebx
 76a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 76d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 770:	89 c8                	mov    %ecx,%eax
 772:	31 d2                	xor    %edx,%edx
 774:	89 cf                	mov    %ecx,%edi
 776:	f7 75 c4             	divl   -0x3c(%ebp)
 779:	0f b6 92 ac 0b 00 00 	movzbl 0xbac(%edx),%edx
 780:	89 45 c0             	mov    %eax,-0x40(%ebp)
 783:	89 d8                	mov    %ebx,%eax
 785:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 788:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 78b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 78e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 791:	76 dd                	jbe    770 <printint+0x30>
  if(neg)
 793:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 796:	85 c9                	test   %ecx,%ecx
 798:	74 0c                	je     7a6 <printint+0x66>
    buf[i++] = '-';
 79a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 79f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 7a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 7a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 7a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 7ad:	eb 07                	jmp    7b6 <printint+0x76>
 7af:	90                   	nop
 7b0:	0f b6 13             	movzbl (%ebx),%edx
 7b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 7b6:	83 ec 04             	sub    $0x4,%esp
 7b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 7bc:	6a 01                	push   $0x1
 7be:	56                   	push   %esi
 7bf:	57                   	push   %edi
 7c0:	e8 ee fe ff ff       	call   6b3 <write>
  while(--i >= 0)
 7c5:	83 c4 10             	add    $0x10,%esp
 7c8:	39 de                	cmp    %ebx,%esi
 7ca:	75 e4                	jne    7b0 <printint+0x70>
    putc(fd, buf[i]);
}
 7cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7cf:	5b                   	pop    %ebx
 7d0:	5e                   	pop    %esi
 7d1:	5f                   	pop    %edi
 7d2:	5d                   	pop    %ebp
 7d3:	c3                   	ret
 7d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 7d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 7df:	eb 87                	jmp    768 <printint+0x28>
 7e1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7e8:	00 
 7e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000007f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7f0:	f3 0f 1e fb          	endbr32
 7f4:	55                   	push   %ebp
 7f5:	89 e5                	mov    %esp,%ebp
 7f7:	57                   	push   %edi
 7f8:	56                   	push   %esi
 7f9:	53                   	push   %ebx
 7fa:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7fd:	8b 75 0c             	mov    0xc(%ebp),%esi
 800:	0f b6 1e             	movzbl (%esi),%ebx
 803:	84 db                	test   %bl,%bl
 805:	0f 84 b4 00 00 00    	je     8bf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 80b:	8d 45 10             	lea    0x10(%ebp),%eax
 80e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 811:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 814:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 816:	89 45 d0             	mov    %eax,-0x30(%ebp)
 819:	eb 33                	jmp    84e <printf+0x5e>
 81b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 820:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 823:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 828:	83 f8 25             	cmp    $0x25,%eax
 82b:	74 17                	je     844 <printf+0x54>
  write(fd, &c, 1);
 82d:	83 ec 04             	sub    $0x4,%esp
 830:	88 5d e7             	mov    %bl,-0x19(%ebp)
 833:	6a 01                	push   $0x1
 835:	57                   	push   %edi
 836:	ff 75 08             	push   0x8(%ebp)
 839:	e8 75 fe ff ff       	call   6b3 <write>
 83e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 841:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 844:	0f b6 1e             	movzbl (%esi),%ebx
 847:	83 c6 01             	add    $0x1,%esi
 84a:	84 db                	test   %bl,%bl
 84c:	74 71                	je     8bf <printf+0xcf>
    c = fmt[i] & 0xff;
 84e:	0f be cb             	movsbl %bl,%ecx
 851:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 854:	85 d2                	test   %edx,%edx
 856:	74 c8                	je     820 <printf+0x30>
      }
    } else if(state == '%'){
 858:	83 fa 25             	cmp    $0x25,%edx
 85b:	75 e7                	jne    844 <printf+0x54>
      if(c == 'd'){
 85d:	83 f8 64             	cmp    $0x64,%eax
 860:	0f 84 9a 00 00 00    	je     900 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 866:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 86c:	83 f9 70             	cmp    $0x70,%ecx
 86f:	74 5f                	je     8d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 871:	83 f8 73             	cmp    $0x73,%eax
 874:	0f 84 d6 00 00 00    	je     950 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 87a:	83 f8 63             	cmp    $0x63,%eax
 87d:	0f 84 8d 00 00 00    	je     910 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 883:	83 f8 25             	cmp    $0x25,%eax
 886:	0f 84 b4 00 00 00    	je     940 <printf+0x150>
  write(fd, &c, 1);
 88c:	83 ec 04             	sub    $0x4,%esp
 88f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 893:	6a 01                	push   $0x1
 895:	57                   	push   %edi
 896:	ff 75 08             	push   0x8(%ebp)
 899:	e8 15 fe ff ff       	call   6b3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 89e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 8a1:	83 c4 0c             	add    $0xc,%esp
 8a4:	6a 01                	push   $0x1
 8a6:	83 c6 01             	add    $0x1,%esi
 8a9:	57                   	push   %edi
 8aa:	ff 75 08             	push   0x8(%ebp)
 8ad:	e8 01 fe ff ff       	call   6b3 <write>
  for(i = 0; fmt[i]; i++){
 8b2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 8b6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 8b9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 8bb:	84 db                	test   %bl,%bl
 8bd:	75 8f                	jne    84e <printf+0x5e>
    }
  }
}
 8bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8c2:	5b                   	pop    %ebx
 8c3:	5e                   	pop    %esi
 8c4:	5f                   	pop    %edi
 8c5:	5d                   	pop    %ebp
 8c6:	c3                   	ret
 8c7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 8ce:	00 
 8cf:	90                   	nop
        printint(fd, *ap, 16, 0);
 8d0:	83 ec 0c             	sub    $0xc,%esp
 8d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 8d8:	6a 00                	push   $0x0
 8da:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 8dd:	8b 45 08             	mov    0x8(%ebp),%eax
 8e0:	8b 13                	mov    (%ebx),%edx
 8e2:	e8 59 fe ff ff       	call   740 <printint>
        ap++;
 8e7:	89 d8                	mov    %ebx,%eax
 8e9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8ec:	31 d2                	xor    %edx,%edx
        ap++;
 8ee:	83 c0 04             	add    $0x4,%eax
 8f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8f4:	e9 4b ff ff ff       	jmp    844 <printf+0x54>
 8f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 900:	83 ec 0c             	sub    $0xc,%esp
 903:	b9 0a 00 00 00       	mov    $0xa,%ecx
 908:	6a 01                	push   $0x1
 90a:	eb ce                	jmp    8da <printf+0xea>
 90c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 910:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 913:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 916:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 918:	6a 01                	push   $0x1
        ap++;
 91a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 91d:	57                   	push   %edi
 91e:	ff 75 08             	push   0x8(%ebp)
        putc(fd, *ap);
 921:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 924:	e8 8a fd ff ff       	call   6b3 <write>
        ap++;
 929:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 92c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 92f:	31 d2                	xor    %edx,%edx
 931:	e9 0e ff ff ff       	jmp    844 <printf+0x54>
 936:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 93d:	00 
 93e:	66 90                	xchg   %ax,%ax
        putc(fd, c);
 940:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 943:	83 ec 04             	sub    $0x4,%esp
 946:	e9 59 ff ff ff       	jmp    8a4 <printf+0xb4>
 94b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 950:	8b 45 d0             	mov    -0x30(%ebp),%eax
 953:	8b 18                	mov    (%eax),%ebx
        ap++;
 955:	83 c0 04             	add    $0x4,%eax
 958:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 95b:	85 db                	test   %ebx,%ebx
 95d:	74 17                	je     976 <printf+0x186>
        while(*s != 0){
 95f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 962:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 964:	84 c0                	test   %al,%al
 966:	0f 84 d8 fe ff ff    	je     844 <printf+0x54>
 96c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 96f:	89 de                	mov    %ebx,%esi
 971:	8b 5d 08             	mov    0x8(%ebp),%ebx
 974:	eb 1a                	jmp    990 <printf+0x1a0>
          s = "(null)";
 976:	bb a5 0b 00 00       	mov    $0xba5,%ebx
        while(*s != 0){
 97b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 97e:	b8 28 00 00 00       	mov    $0x28,%eax
 983:	89 de                	mov    %ebx,%esi
 985:	8b 5d 08             	mov    0x8(%ebp),%ebx
 988:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 98f:	00 
  write(fd, &c, 1);
 990:	83 ec 04             	sub    $0x4,%esp
          s++;
 993:	83 c6 01             	add    $0x1,%esi
 996:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 999:	6a 01                	push   $0x1
 99b:	57                   	push   %edi
 99c:	53                   	push   %ebx
 99d:	e8 11 fd ff ff       	call   6b3 <write>
        while(*s != 0){
 9a2:	0f b6 06             	movzbl (%esi),%eax
 9a5:	83 c4 10             	add    $0x10,%esp
 9a8:	84 c0                	test   %al,%al
 9aa:	75 e4                	jne    990 <printf+0x1a0>
 9ac:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 9af:	31 d2                	xor    %edx,%edx
 9b1:	e9 8e fe ff ff       	jmp    844 <printf+0x54>
 9b6:	66 90                	xchg   %ax,%ax
 9b8:	66 90                	xchg   %ax,%ax
 9ba:	66 90                	xchg   %ax,%ax
 9bc:	66 90                	xchg   %ax,%ax
 9be:	66 90                	xchg   %ax,%ax

000009c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9c0:	f3 0f 1e fb          	endbr32
 9c4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9c5:	a1 0c 0f 00 00       	mov    0xf0c,%eax
{
 9ca:	89 e5                	mov    %esp,%ebp
 9cc:	57                   	push   %edi
 9cd:	56                   	push   %esi
 9ce:	53                   	push   %ebx
 9cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9d2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 9d4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9d7:	39 c8                	cmp    %ecx,%eax
 9d9:	73 15                	jae    9f0 <free+0x30>
 9db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 9e0:	39 d1                	cmp    %edx,%ecx
 9e2:	72 14                	jb     9f8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9e4:	39 d0                	cmp    %edx,%eax
 9e6:	73 10                	jae    9f8 <free+0x38>
{
 9e8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9ea:	8b 10                	mov    (%eax),%edx
 9ec:	39 c8                	cmp    %ecx,%eax
 9ee:	72 f0                	jb     9e0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9f0:	39 d0                	cmp    %edx,%eax
 9f2:	72 f4                	jb     9e8 <free+0x28>
 9f4:	39 d1                	cmp    %edx,%ecx
 9f6:	73 f0                	jae    9e8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9fe:	39 fa                	cmp    %edi,%edx
 a00:	74 1e                	je     a20 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a02:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a05:	8b 50 04             	mov    0x4(%eax),%edx
 a08:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a0b:	39 f1                	cmp    %esi,%ecx
 a0d:	74 28                	je     a37 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a0f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 a11:	5b                   	pop    %ebx
  freep = p;
 a12:	a3 0c 0f 00 00       	mov    %eax,0xf0c
}
 a17:	5e                   	pop    %esi
 a18:	5f                   	pop    %edi
 a19:	5d                   	pop    %ebp
 a1a:	c3                   	ret
 a1b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 a20:	03 72 04             	add    0x4(%edx),%esi
 a23:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a26:	8b 10                	mov    (%eax),%edx
 a28:	8b 12                	mov    (%edx),%edx
 a2a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a2d:	8b 50 04             	mov    0x4(%eax),%edx
 a30:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a33:	39 f1                	cmp    %esi,%ecx
 a35:	75 d8                	jne    a0f <free+0x4f>
    p->s.size += bp->s.size;
 a37:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 a3a:	a3 0c 0f 00 00       	mov    %eax,0xf0c
    p->s.size += bp->s.size;
 a3f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a42:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a45:	89 10                	mov    %edx,(%eax)
}
 a47:	5b                   	pop    %ebx
 a48:	5e                   	pop    %esi
 a49:	5f                   	pop    %edi
 a4a:	5d                   	pop    %ebp
 a4b:	c3                   	ret
 a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a50 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a50:	f3 0f 1e fb          	endbr32
 a54:	55                   	push   %ebp
 a55:	89 e5                	mov    %esp,%ebp
 a57:	57                   	push   %edi
 a58:	56                   	push   %esi
 a59:	53                   	push   %ebx
 a5a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a5d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a60:	8b 3d 0c 0f 00 00    	mov    0xf0c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a66:	8d 70 07             	lea    0x7(%eax),%esi
 a69:	c1 ee 03             	shr    $0x3,%esi
 a6c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a6f:	85 ff                	test   %edi,%edi
 a71:	0f 84 a9 00 00 00    	je     b20 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a77:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 a79:	8b 48 04             	mov    0x4(%eax),%ecx
 a7c:	39 f1                	cmp    %esi,%ecx
 a7e:	73 6d                	jae    aed <malloc+0x9d>
 a80:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 a86:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a8b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a8e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 a95:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 a98:	eb 17                	jmp    ab1 <malloc+0x61>
 a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 aa2:	8b 4a 04             	mov    0x4(%edx),%ecx
 aa5:	39 f1                	cmp    %esi,%ecx
 aa7:	73 4f                	jae    af8 <malloc+0xa8>
 aa9:	8b 3d 0c 0f 00 00    	mov    0xf0c,%edi
 aaf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ab1:	39 c7                	cmp    %eax,%edi
 ab3:	75 eb                	jne    aa0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 ab5:	83 ec 0c             	sub    $0xc,%esp
 ab8:	ff 75 e4             	push   -0x1c(%ebp)
 abb:	e8 5b fc ff ff       	call   71b <sbrk>
  if(p == (char*)-1)
 ac0:	83 c4 10             	add    $0x10,%esp
 ac3:	83 f8 ff             	cmp    $0xffffffff,%eax
 ac6:	74 1b                	je     ae3 <malloc+0x93>
  hp->s.size = nu;
 ac8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 acb:	83 ec 0c             	sub    $0xc,%esp
 ace:	83 c0 08             	add    $0x8,%eax
 ad1:	50                   	push   %eax
 ad2:	e8 e9 fe ff ff       	call   9c0 <free>
  return freep;
 ad7:	a1 0c 0f 00 00       	mov    0xf0c,%eax
      if((p = morecore(nunits)) == 0)
 adc:	83 c4 10             	add    $0x10,%esp
 adf:	85 c0                	test   %eax,%eax
 ae1:	75 bd                	jne    aa0 <malloc+0x50>
        return 0;
  }
}
 ae3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 ae6:	31 c0                	xor    %eax,%eax
}
 ae8:	5b                   	pop    %ebx
 ae9:	5e                   	pop    %esi
 aea:	5f                   	pop    %edi
 aeb:	5d                   	pop    %ebp
 aec:	c3                   	ret
    if(p->s.size >= nunits){
 aed:	89 c2                	mov    %eax,%edx
 aef:	89 f8                	mov    %edi,%eax
 af1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 af8:	39 ce                	cmp    %ecx,%esi
 afa:	74 54                	je     b50 <malloc+0x100>
        p->s.size -= nunits;
 afc:	29 f1                	sub    %esi,%ecx
 afe:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 b01:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 b04:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 b07:	a3 0c 0f 00 00       	mov    %eax,0xf0c
}
 b0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 b0f:	8d 42 08             	lea    0x8(%edx),%eax
}
 b12:	5b                   	pop    %ebx
 b13:	5e                   	pop    %esi
 b14:	5f                   	pop    %edi
 b15:	5d                   	pop    %ebp
 b16:	c3                   	ret
 b17:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 b1e:	00 
 b1f:	90                   	nop
    base.s.ptr = freep = prevp = &base;
 b20:	c7 05 0c 0f 00 00 10 	movl   $0xf10,0xf0c
 b27:	0f 00 00 
    base.s.size = 0;
 b2a:	bf 10 0f 00 00       	mov    $0xf10,%edi
    base.s.ptr = freep = prevp = &base;
 b2f:	c7 05 10 0f 00 00 10 	movl   $0xf10,0xf10
 b36:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b39:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 b3b:	c7 05 14 0f 00 00 00 	movl   $0x0,0xf14
 b42:	00 00 00 
    if(p->s.size >= nunits){
 b45:	e9 36 ff ff ff       	jmp    a80 <malloc+0x30>
 b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b50:	8b 0a                	mov    (%edx),%ecx
 b52:	89 08                	mov    %ecx,(%eax)
 b54:	eb b1                	jmp    b07 <malloc+0xb7>
