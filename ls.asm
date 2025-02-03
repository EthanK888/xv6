
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 20             	sub    $0x20,%esp
  14:	8b 71 04             	mov    0x4(%ecx),%esi
  17:	8b 19                	mov    (%ecx),%ebx
  int i;
  int showHidden = 0;

  if (strcmp(argv[argc-1], "-a") == 0) {
  19:	68 30 0b 00 00       	push   $0xb30
  1e:	ff 74 9e fc          	push   -0x4(%esi,%ebx,4)
  22:	e8 19 04 00 00       	call   440 <strcmp>
  int showHidden = 0;
  27:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  if (strcmp(argv[argc-1], "-a") == 0) {
  2e:	83 c4 10             	add    $0x10,%esp
  31:	85 c0                	test   %eax,%eax
  33:	75 0a                	jne    3f <main+0x3f>
    showHidden = 1;
  35:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    argc--;
  3c:	83 eb 01             	sub    $0x1,%ebx
  }
  if(argc < 2){
    ls(".", showHidden);
    exit();
  }
  for(i=1; i<argc; i++)
  3f:	bf 01 00 00 00       	mov    $0x1,%edi
  if(argc < 2){
  44:	83 fb 01             	cmp    $0x1,%ebx
  47:	7e 24                	jle    6d <main+0x6d>
  49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ls(argv[i], showHidden);
  50:	83 ec 08             	sub    $0x8,%esp
  53:	ff 75 e4             	push   -0x1c(%ebp)
  56:	ff 34 be             	push   (%esi,%edi,4)
  for(i=1; i<argc; i++)
  59:	83 c7 01             	add    $0x1,%edi
    ls(argv[i], showHidden);
  5c:	e8 7f 01 00 00       	call   1e0 <ls>
  for(i=1; i<argc; i++)
  61:	83 c4 10             	add    $0x10,%esp
  64:	39 fb                	cmp    %edi,%ebx
  66:	75 e8                	jne    50 <main+0x50>
  exit();
  68:	e8 f6 05 00 00       	call   663 <exit>
    ls(".", showHidden);
  6d:	50                   	push   %eax
  6e:	50                   	push   %eax
  6f:	ff 75 e4             	push   -0x1c(%ebp)
  72:	68 33 0b 00 00       	push   $0xb33
  77:	e8 64 01 00 00       	call   1e0 <ls>
    exit();
  7c:	e8 e2 05 00 00       	call   663 <exit>
  81:	66 90                	xchg   %ax,%ax
  83:	66 90                	xchg   %ax,%ax
  85:	66 90                	xchg   %ax,%ax
  87:	66 90                	xchg   %ax,%ax
  89:	66 90                	xchg   %ax,%ax
  8b:	66 90                	xchg   %ax,%ax
  8d:	66 90                	xchg   %ax,%ax
  8f:	90                   	nop

00000090 <fmtname>:
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	57                   	push   %edi
  94:	56                   	push   %esi
  95:	53                   	push   %ebx
  96:	83 ec 18             	sub    $0x18,%esp
  99:	8b 7d 08             	mov    0x8(%ebp),%edi
  9c:	8b 75 0c             	mov    0xc(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  9f:	57                   	push   %edi
  a0:	e8 fb 03 00 00       	call   4a0 <strlen>
  a5:	83 c4 10             	add    $0x10,%esp
  a8:	01 f8                	add    %edi,%eax
  aa:	89 c3                	mov    %eax,%ebx
  ac:	73 0b                	jae    b9 <fmtname+0x29>
  ae:	eb 0e                	jmp    be <fmtname+0x2e>
  b0:	8d 43 ff             	lea    -0x1(%ebx),%eax
  b3:	39 c7                	cmp    %eax,%edi
  b5:	77 0a                	ja     c1 <fmtname+0x31>
  b7:	89 c3                	mov    %eax,%ebx
  b9:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  bc:	75 f2                	jne    b0 <fmtname+0x20>
  p++;
  be:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ){
  c1:	83 ec 0c             	sub    $0xc,%esp
  c4:	53                   	push   %ebx
  c5:	e8 d6 03 00 00       	call   4a0 <strlen>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	83 f8 0d             	cmp    $0xd,%eax
  d0:	76 16                	jbe    e8 <fmtname+0x58>
    if(type == T_DIR){
  d2:	66 83 fe 01          	cmp    $0x1,%si
  d6:	74 48                	je     120 <fmtname+0x90>
}
  d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  db:	89 d8                	mov    %ebx,%eax
  dd:	5b                   	pop    %ebx
  de:	5e                   	pop    %esi
  df:	5f                   	pop    %edi
  e0:	5d                   	pop    %ebp
  e1:	c3                   	ret    
  e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  memmove(buf, p, strlen(p));
  e8:	83 ec 0c             	sub    $0xc,%esp
  eb:	53                   	push   %ebx
  ec:	e8 af 03 00 00       	call   4a0 <strlen>
  f1:	83 c4 0c             	add    $0xc,%esp
  f4:	50                   	push   %eax
  f5:	53                   	push   %ebx
  f6:	68 e4 0e 00 00       	push   $0xee4
  fb:	e8 30 05 00 00       	call   630 <memmove>
  if(type == T_FILE){
 100:	83 c4 10             	add    $0x10,%esp
 103:	66 83 fe 02          	cmp    $0x2,%si
 107:	74 3f                	je     148 <fmtname+0xb8>
  else if(type == T_DIR){
 109:	66 83 fe 01          	cmp    $0x1,%si
 10d:	74 71                	je     180 <fmtname+0xf0>
}
 10f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return buf;
 112:	bb e4 0e 00 00       	mov    $0xee4,%ebx
}
 117:	89 d8                	mov    %ebx,%eax
 119:	5b                   	pop    %ebx
 11a:	5e                   	pop    %esi
 11b:	5f                   	pop    %edi
 11c:	5d                   	pop    %ebp
 11d:	c3                   	ret    
 11e:	66 90                	xchg   %ax,%ax
      memset(p+strlen(p), '/', 1);
 120:	83 ec 0c             	sub    $0xc,%esp
 123:	53                   	push   %ebx
 124:	e8 77 03 00 00       	call   4a0 <strlen>
 129:	83 c4 0c             	add    $0xc,%esp
 12c:	01 d8                	add    %ebx,%eax
 12e:	6a 01                	push   $0x1
 130:	6a 2f                	push   $0x2f
 132:	50                   	push   %eax
 133:	e8 98 03 00 00       	call   4d0 <memset>
 138:	83 c4 10             	add    $0x10,%esp
}
 13b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 13e:	89 d8                	mov    %ebx,%eax
 140:	5b                   	pop    %ebx
 141:	5e                   	pop    %esi
 142:	5f                   	pop    %edi
 143:	5d                   	pop    %ebp
 144:	c3                   	ret    
 145:	8d 76 00             	lea    0x0(%esi),%esi
    memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 148:	83 ec 0c             	sub    $0xc,%esp
 14b:	53                   	push   %ebx
 14c:	e8 4f 03 00 00       	call   4a0 <strlen>
 151:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
 154:	bb e4 0e 00 00       	mov    $0xee4,%ebx
    memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 159:	89 c6                	mov    %eax,%esi
 15b:	e8 40 03 00 00       	call   4a0 <strlen>
 160:	ba 0e 00 00 00       	mov    $0xe,%edx
 165:	83 c4 0c             	add    $0xc,%esp
 168:	29 f2                	sub    %esi,%edx
 16a:	05 e4 0e 00 00       	add    $0xee4,%eax
 16f:	52                   	push   %edx
 170:	6a 20                	push   $0x20
 172:	50                   	push   %eax
 173:	e8 58 03 00 00       	call   4d0 <memset>
 178:	83 c4 10             	add    $0x10,%esp
 17b:	e9 58 ff ff ff       	jmp    d8 <fmtname+0x48>
    memset(buf+strlen(p), '/', 1);
 180:	83 ec 0c             	sub    $0xc,%esp
 183:	53                   	push   %ebx
 184:	e8 17 03 00 00       	call   4a0 <strlen>
 189:	83 c4 0c             	add    $0xc,%esp
 18c:	05 e4 0e 00 00       	add    $0xee4,%eax
 191:	6a 01                	push   $0x1
 193:	6a 2f                	push   $0x2f
 195:	50                   	push   %eax
 196:	e8 35 03 00 00       	call   4d0 <memset>
    memset(buf+strlen(p)+1, ' ', DIRSIZ-strlen(p)+1);
 19b:	89 1c 24             	mov    %ebx,(%esp)
 19e:	e8 fd 02 00 00       	call   4a0 <strlen>
 1a3:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
 1a6:	bb e4 0e 00 00       	mov    $0xee4,%ebx
    memset(buf+strlen(p)+1, ' ', DIRSIZ-strlen(p)+1);
 1ab:	89 c6                	mov    %eax,%esi
 1ad:	e8 ee 02 00 00       	call   4a0 <strlen>
 1b2:	ba 0f 00 00 00       	mov    $0xf,%edx
 1b7:	83 c4 0c             	add    $0xc,%esp
 1ba:	29 f2                	sub    %esi,%edx
 1bc:	05 e5 0e 00 00       	add    $0xee5,%eax
 1c1:	52                   	push   %edx
 1c2:	6a 20                	push   $0x20
 1c4:	50                   	push   %eax
 1c5:	e8 06 03 00 00       	call   4d0 <memset>
 1ca:	83 c4 10             	add    $0x10,%esp
 1cd:	e9 06 ff ff ff       	jmp    d8 <fmtname+0x48>
 1d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001e0 <ls>:
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
 1e5:	53                   	push   %ebx
 1e6:	81 ec 54 02 00 00    	sub    $0x254,%esp
 1ec:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 1ef:	6a 00                	push   $0x0
 1f1:	57                   	push   %edi
 1f2:	e8 ac 04 00 00       	call   6a3 <open>
 1f7:	83 c4 10             	add    $0x10,%esp
 1fa:	85 c0                	test   %eax,%eax
 1fc:	0f 88 8e 01 00 00    	js     390 <ls+0x1b0>
  if(fstat(fd, &st) < 0){
 202:	83 ec 08             	sub    $0x8,%esp
 205:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 20b:	89 c3                	mov    %eax,%ebx
 20d:	56                   	push   %esi
 20e:	50                   	push   %eax
 20f:	e8 a7 04 00 00       	call   6bb <fstat>
 214:	83 c4 10             	add    $0x10,%esp
 217:	85 c0                	test   %eax,%eax
 219:	0f 88 b1 01 00 00    	js     3d0 <ls+0x1f0>
  switch(st.type){
 21f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 226:	66 83 f8 01          	cmp    $0x1,%ax
 22a:	74 64                	je     290 <ls+0xb0>
 22c:	66 83 f8 02          	cmp    $0x2,%ax
 230:	74 1e                	je     250 <ls+0x70>
  close(fd);
 232:	83 ec 0c             	sub    $0xc,%esp
 235:	53                   	push   %ebx
 236:	e8 50 04 00 00       	call   68b <close>
 23b:	83 c4 10             	add    $0x10,%esp
}
 23e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 241:	5b                   	pop    %ebx
 242:	5e                   	pop    %esi
 243:	5f                   	pop    %edi
 244:	5d                   	pop    %ebp
 245:	c3                   	ret    
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path, st.type), st.type, st.ino, st.size);
 250:	83 ec 08             	sub    $0x8,%esp
 253:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 259:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 25f:	6a 02                	push   $0x2
 261:	57                   	push   %edi
 262:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 268:	e8 23 fe ff ff       	call   90 <fmtname>
 26d:	5a                   	pop    %edx
 26e:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 274:	59                   	pop    %ecx
 275:	52                   	push   %edx
 276:	56                   	push   %esi
 277:	6a 02                	push   $0x2
 279:	50                   	push   %eax
 27a:	68 10 0b 00 00       	push   $0xb10
 27f:	6a 01                	push   $0x1
 281:	e8 3a 05 00 00       	call   7c0 <printf>
    break;
 286:	83 c4 20             	add    $0x20,%esp
 289:	eb a7                	jmp    232 <ls+0x52>
 28b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 28f:	90                   	nop
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 290:	83 ec 0c             	sub    $0xc,%esp
 293:	57                   	push   %edi
 294:	e8 07 02 00 00       	call   4a0 <strlen>
 299:	83 c4 10             	add    $0x10,%esp
 29c:	83 c0 10             	add    $0x10,%eax
 29f:	3d 00 02 00 00       	cmp    $0x200,%eax
 2a4:	0f 87 06 01 00 00    	ja     3b0 <ls+0x1d0>
    strcpy(buf, path);
 2aa:	83 ec 08             	sub    $0x8,%esp
 2ad:	57                   	push   %edi
 2ae:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 2b4:	57                   	push   %edi
 2b5:	e8 56 01 00 00       	call   410 <strcpy>
    p = buf+strlen(buf);
 2ba:	89 3c 24             	mov    %edi,(%esp)
 2bd:	e8 de 01 00 00       	call   4a0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2c2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 2c5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 2c7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 2ca:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
    *p++ = '/';
 2d0:	89 8d b0 fd ff ff    	mov    %ecx,-0x250(%ebp)
 2d6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2e0:	83 ec 04             	sub    $0x4,%esp
 2e3:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 2e9:	6a 10                	push   $0x10
 2eb:	50                   	push   %eax
 2ec:	53                   	push   %ebx
 2ed:	e8 89 03 00 00       	call   67b <read>
 2f2:	83 c4 10             	add    $0x10,%esp
 2f5:	83 f8 10             	cmp    $0x10,%eax
 2f8:	0f 85 34 ff ff ff    	jne    232 <ls+0x52>
      if(de.inum == 0)
 2fe:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 305:	00 
 306:	74 d8                	je     2e0 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 308:	83 ec 04             	sub    $0x4,%esp
 30b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 311:	6a 0e                	push   $0xe
 313:	50                   	push   %eax
 314:	ff b5 b0 fd ff ff    	push   -0x250(%ebp)
 31a:	e8 11 03 00 00       	call   630 <memmove>
      p[DIRSIZ] = 0;
 31f:	8b 85 b4 fd ff ff    	mov    -0x24c(%ebp),%eax
 325:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 329:	59                   	pop    %ecx
 32a:	58                   	pop    %eax
 32b:	56                   	push   %esi
 32c:	57                   	push   %edi
 32d:	e8 6e 02 00 00       	call   5a0 <stat>
 332:	83 c4 10             	add    $0x10,%esp
 335:	85 c0                	test   %eax,%eax
 337:	0f 88 bb 00 00 00    	js     3f8 <ls+0x218>
        char *filename = fmtname(buf, st.type);
 33d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 344:	83 ec 08             	sub    $0x8,%esp
 347:	50                   	push   %eax
 348:	57                   	push   %edi
 349:	e8 42 fd ff ff       	call   90 <fmtname>
        if (showHidden || *filename != '.')
 34e:	8b 55 0c             	mov    0xc(%ebp),%edx
 351:	83 c4 10             	add    $0x10,%esp
 354:	85 d2                	test   %edx,%edx
 356:	75 05                	jne    35d <ls+0x17d>
 358:	80 38 2e             	cmpb   $0x2e,(%eax)
 35b:	74 83                	je     2e0 <ls+0x100>
          printf(1, "%s %d %d %d\n", filename, st.type, st.ino, st.size);
 35d:	0f bf 95 d4 fd ff ff 	movswl -0x22c(%ebp),%edx
 364:	83 ec 08             	sub    $0x8,%esp
 367:	ff b5 e4 fd ff ff    	push   -0x21c(%ebp)
 36d:	ff b5 dc fd ff ff    	push   -0x224(%ebp)
 373:	52                   	push   %edx
 374:	50                   	push   %eax
 375:	68 10 0b 00 00       	push   $0xb10
 37a:	6a 01                	push   $0x1
 37c:	e8 3f 04 00 00       	call   7c0 <printf>
 381:	83 c4 20             	add    $0x20,%esp
 384:	e9 57 ff ff ff       	jmp    2e0 <ls+0x100>
 389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "ls: cannot open %s\n", path);
 390:	83 ec 04             	sub    $0x4,%esp
 393:	57                   	push   %edi
 394:	68 e8 0a 00 00       	push   $0xae8
 399:	6a 02                	push   $0x2
 39b:	e8 20 04 00 00       	call   7c0 <printf>
    return;
 3a0:	83 c4 10             	add    $0x10,%esp
}
 3a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3a6:	5b                   	pop    %ebx
 3a7:	5e                   	pop    %esi
 3a8:	5f                   	pop    %edi
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    
 3ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop
      printf(1, "ls: path too long\n");
 3b0:	83 ec 08             	sub    $0x8,%esp
 3b3:	68 1d 0b 00 00       	push   $0xb1d
 3b8:	6a 01                	push   $0x1
 3ba:	e8 01 04 00 00       	call   7c0 <printf>
      break;
 3bf:	83 c4 10             	add    $0x10,%esp
 3c2:	e9 6b fe ff ff       	jmp    232 <ls+0x52>
 3c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ce:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
 3d0:	83 ec 04             	sub    $0x4,%esp
 3d3:	57                   	push   %edi
 3d4:	68 fc 0a 00 00       	push   $0xafc
 3d9:	6a 02                	push   $0x2
 3db:	e8 e0 03 00 00       	call   7c0 <printf>
    close(fd);
 3e0:	89 1c 24             	mov    %ebx,(%esp)
 3e3:	e8 a3 02 00 00       	call   68b <close>
    return;
 3e8:	83 c4 10             	add    $0x10,%esp
}
 3eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ee:	5b                   	pop    %ebx
 3ef:	5e                   	pop    %esi
 3f0:	5f                   	pop    %edi
 3f1:	5d                   	pop    %ebp
 3f2:	c3                   	ret    
 3f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3f7:	90                   	nop
        printf(1, "ls: cannot stat %s\n", buf);
 3f8:	83 ec 04             	sub    $0x4,%esp
 3fb:	57                   	push   %edi
 3fc:	68 fc 0a 00 00       	push   $0xafc
 401:	6a 01                	push   $0x1
 403:	e8 b8 03 00 00       	call   7c0 <printf>
        continue;
 408:	83 c4 10             	add    $0x10,%esp
 40b:	e9 d0 fe ff ff       	jmp    2e0 <ls+0x100>

00000410 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 410:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 411:	31 c0                	xor    %eax,%eax
{
 413:	89 e5                	mov    %esp,%ebp
 415:	53                   	push   %ebx
 416:	8b 4d 08             	mov    0x8(%ebp),%ecx
 419:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 420:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 424:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 427:	83 c0 01             	add    $0x1,%eax
 42a:	84 d2                	test   %dl,%dl
 42c:	75 f2                	jne    420 <strcpy+0x10>
    ;
  return os;
}
 42e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 431:	89 c8                	mov    %ecx,%eax
 433:	c9                   	leave  
 434:	c3                   	ret    
 435:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000440 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	53                   	push   %ebx
 444:	8b 55 08             	mov    0x8(%ebp),%edx
 447:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 44a:	0f b6 02             	movzbl (%edx),%eax
 44d:	84 c0                	test   %al,%al
 44f:	75 17                	jne    468 <strcmp+0x28>
 451:	eb 3a                	jmp    48d <strcmp+0x4d>
 453:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 457:	90                   	nop
 458:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 45c:	83 c2 01             	add    $0x1,%edx
 45f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 462:	84 c0                	test   %al,%al
 464:	74 1a                	je     480 <strcmp+0x40>
    p++, q++;
 466:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 468:	0f b6 19             	movzbl (%ecx),%ebx
 46b:	38 c3                	cmp    %al,%bl
 46d:	74 e9                	je     458 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 46f:	29 d8                	sub    %ebx,%eax
}
 471:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 474:	c9                   	leave  
 475:	c3                   	ret    
 476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 480:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 484:	31 c0                	xor    %eax,%eax
 486:	29 d8                	sub    %ebx,%eax
}
 488:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 48b:	c9                   	leave  
 48c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 48d:	0f b6 19             	movzbl (%ecx),%ebx
 490:	31 c0                	xor    %eax,%eax
 492:	eb db                	jmp    46f <strcmp+0x2f>
 494:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop

000004a0 <strlen>:

uint
strlen(const char *s)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 4a6:	80 3a 00             	cmpb   $0x0,(%edx)
 4a9:	74 15                	je     4c0 <strlen+0x20>
 4ab:	31 c0                	xor    %eax,%eax
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
 4b0:	83 c0 01             	add    $0x1,%eax
 4b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 4b7:	89 c1                	mov    %eax,%ecx
 4b9:	75 f5                	jne    4b0 <strlen+0x10>
    ;
  return n;
}
 4bb:	89 c8                	mov    %ecx,%eax
 4bd:	5d                   	pop    %ebp
 4be:	c3                   	ret    
 4bf:	90                   	nop
  for(n = 0; s[n]; n++)
 4c0:	31 c9                	xor    %ecx,%ecx
}
 4c2:	5d                   	pop    %ebp
 4c3:	89 c8                	mov    %ecx,%eax
 4c5:	c3                   	ret    
 4c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cd:	8d 76 00             	lea    0x0(%esi),%esi

000004d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4da:	8b 45 0c             	mov    0xc(%ebp),%eax
 4dd:	89 d7                	mov    %edx,%edi
 4df:	fc                   	cld    
 4e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4e5:	89 d0                	mov    %edx,%eax
 4e7:	c9                   	leave  
 4e8:	c3                   	ret    
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004f0 <strchr>:

char*
strchr(const char *s, char c)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	8b 45 08             	mov    0x8(%ebp),%eax
 4f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4fa:	0f b6 10             	movzbl (%eax),%edx
 4fd:	84 d2                	test   %dl,%dl
 4ff:	75 12                	jne    513 <strchr+0x23>
 501:	eb 1d                	jmp    520 <strchr+0x30>
 503:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 507:	90                   	nop
 508:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 50c:	83 c0 01             	add    $0x1,%eax
 50f:	84 d2                	test   %dl,%dl
 511:	74 0d                	je     520 <strchr+0x30>
    if(*s == c)
 513:	38 d1                	cmp    %dl,%cl
 515:	75 f1                	jne    508 <strchr+0x18>
      return (char*)s;
  return 0;
}
 517:	5d                   	pop    %ebp
 518:	c3                   	ret    
 519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 520:	31 c0                	xor    %eax,%eax
}
 522:	5d                   	pop    %ebp
 523:	c3                   	ret    
 524:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 52f:	90                   	nop

00000530 <gets>:

char*
gets(char *buf, int max)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 535:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 538:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 539:	31 db                	xor    %ebx,%ebx
{
 53b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 53e:	eb 27                	jmp    567 <gets+0x37>
    cc = read(0, &c, 1);
 540:	83 ec 04             	sub    $0x4,%esp
 543:	6a 01                	push   $0x1
 545:	57                   	push   %edi
 546:	6a 00                	push   $0x0
 548:	e8 2e 01 00 00       	call   67b <read>
    if(cc < 1)
 54d:	83 c4 10             	add    $0x10,%esp
 550:	85 c0                	test   %eax,%eax
 552:	7e 1d                	jle    571 <gets+0x41>
      break;
    buf[i++] = c;
 554:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 558:	8b 55 08             	mov    0x8(%ebp),%edx
 55b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 55f:	3c 0a                	cmp    $0xa,%al
 561:	74 1d                	je     580 <gets+0x50>
 563:	3c 0d                	cmp    $0xd,%al
 565:	74 19                	je     580 <gets+0x50>
  for(i=0; i+1 < max; ){
 567:	89 de                	mov    %ebx,%esi
 569:	83 c3 01             	add    $0x1,%ebx
 56c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 56f:	7c cf                	jl     540 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 571:	8b 45 08             	mov    0x8(%ebp),%eax
 574:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 578:	8d 65 f4             	lea    -0xc(%ebp),%esp
 57b:	5b                   	pop    %ebx
 57c:	5e                   	pop    %esi
 57d:	5f                   	pop    %edi
 57e:	5d                   	pop    %ebp
 57f:	c3                   	ret    
  buf[i] = '\0';
 580:	8b 45 08             	mov    0x8(%ebp),%eax
 583:	89 de                	mov    %ebx,%esi
 585:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 589:	8d 65 f4             	lea    -0xc(%ebp),%esp
 58c:	5b                   	pop    %ebx
 58d:	5e                   	pop    %esi
 58e:	5f                   	pop    %edi
 58f:	5d                   	pop    %ebp
 590:	c3                   	ret    
 591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 598:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop

000005a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	56                   	push   %esi
 5a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5a5:	83 ec 08             	sub    $0x8,%esp
 5a8:	6a 00                	push   $0x0
 5aa:	ff 75 08             	push   0x8(%ebp)
 5ad:	e8 f1 00 00 00       	call   6a3 <open>
  if(fd < 0)
 5b2:	83 c4 10             	add    $0x10,%esp
 5b5:	85 c0                	test   %eax,%eax
 5b7:	78 27                	js     5e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 5b9:	83 ec 08             	sub    $0x8,%esp
 5bc:	ff 75 0c             	push   0xc(%ebp)
 5bf:	89 c3                	mov    %eax,%ebx
 5c1:	50                   	push   %eax
 5c2:	e8 f4 00 00 00       	call   6bb <fstat>
  close(fd);
 5c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 5ca:	89 c6                	mov    %eax,%esi
  close(fd);
 5cc:	e8 ba 00 00 00       	call   68b <close>
  return r;
 5d1:	83 c4 10             	add    $0x10,%esp
}
 5d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5d7:	89 f0                	mov    %esi,%eax
 5d9:	5b                   	pop    %ebx
 5da:	5e                   	pop    %esi
 5db:	5d                   	pop    %ebp
 5dc:	c3                   	ret    
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 5e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5e5:	eb ed                	jmp    5d4 <stat+0x34>
 5e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ee:	66 90                	xchg   %ax,%ax

000005f0 <atoi>:

int
atoi(const char *s)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	53                   	push   %ebx
 5f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5f7:	0f be 02             	movsbl (%edx),%eax
 5fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 5fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 600:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 605:	77 1e                	ja     625 <atoi+0x35>
 607:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 610:	83 c2 01             	add    $0x1,%edx
 613:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 616:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 61a:	0f be 02             	movsbl (%edx),%eax
 61d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 620:	80 fb 09             	cmp    $0x9,%bl
 623:	76 eb                	jbe    610 <atoi+0x20>
  return n;
}
 625:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 628:	89 c8                	mov    %ecx,%eax
 62a:	c9                   	leave  
 62b:	c3                   	ret    
 62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000630 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	8b 45 10             	mov    0x10(%ebp),%eax
 637:	8b 55 08             	mov    0x8(%ebp),%edx
 63a:	56                   	push   %esi
 63b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 63e:	85 c0                	test   %eax,%eax
 640:	7e 13                	jle    655 <memmove+0x25>
 642:	01 d0                	add    %edx,%eax
  dst = vdst;
 644:	89 d7                	mov    %edx,%edi
 646:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 650:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 651:	39 f8                	cmp    %edi,%eax
 653:	75 fb                	jne    650 <memmove+0x20>
  return vdst;
}
 655:	5e                   	pop    %esi
 656:	89 d0                	mov    %edx,%eax
 658:	5f                   	pop    %edi
 659:	5d                   	pop    %ebp
 65a:	c3                   	ret    

0000065b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 65b:	b8 01 00 00 00       	mov    $0x1,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <exit>:
SYSCALL(exit)
 663:	b8 02 00 00 00       	mov    $0x2,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <wait>:
SYSCALL(wait)
 66b:	b8 03 00 00 00       	mov    $0x3,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <pipe>:
SYSCALL(pipe)
 673:	b8 04 00 00 00       	mov    $0x4,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <read>:
SYSCALL(read)
 67b:	b8 05 00 00 00       	mov    $0x5,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <write>:
SYSCALL(write)
 683:	b8 10 00 00 00       	mov    $0x10,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <close>:
SYSCALL(close)
 68b:	b8 15 00 00 00       	mov    $0x15,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret    

00000693 <kill>:
SYSCALL(kill)
 693:	b8 06 00 00 00       	mov    $0x6,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret    

0000069b <exec>:
SYSCALL(exec)
 69b:	b8 07 00 00 00       	mov    $0x7,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret    

000006a3 <open>:
SYSCALL(open)
 6a3:	b8 0f 00 00 00       	mov    $0xf,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret    

000006ab <mknod>:
SYSCALL(mknod)
 6ab:	b8 11 00 00 00       	mov    $0x11,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret    

000006b3 <unlink>:
SYSCALL(unlink)
 6b3:	b8 12 00 00 00       	mov    $0x12,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret    

000006bb <fstat>:
SYSCALL(fstat)
 6bb:	b8 08 00 00 00       	mov    $0x8,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret    

000006c3 <link>:
SYSCALL(link)
 6c3:	b8 13 00 00 00       	mov    $0x13,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret    

000006cb <mkdir>:
SYSCALL(mkdir)
 6cb:	b8 14 00 00 00       	mov    $0x14,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    

000006d3 <chdir>:
SYSCALL(chdir)
 6d3:	b8 09 00 00 00       	mov    $0x9,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <dup>:
SYSCALL(dup)
 6db:	b8 0a 00 00 00       	mov    $0xa,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <getpid>:
SYSCALL(getpid)
 6e3:	b8 0b 00 00 00       	mov    $0xb,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <sbrk>:
SYSCALL(sbrk)
 6eb:	b8 0c 00 00 00       	mov    $0xc,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    

000006f3 <sleep>:
SYSCALL(sleep)
 6f3:	b8 0d 00 00 00       	mov    $0xd,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret    

000006fb <uptime>:
SYSCALL(uptime)
 6fb:	b8 0e 00 00 00       	mov    $0xe,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret    
 703:	66 90                	xchg   %ax,%ax
 705:	66 90                	xchg   %ax,%ax
 707:	66 90                	xchg   %ax,%ax
 709:	66 90                	xchg   %ax,%ax
 70b:	66 90                	xchg   %ax,%ax
 70d:	66 90                	xchg   %ax,%ax
 70f:	90                   	nop

00000710 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	57                   	push   %edi
 714:	56                   	push   %esi
 715:	53                   	push   %ebx
 716:	83 ec 3c             	sub    $0x3c,%esp
 719:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 71c:	89 d1                	mov    %edx,%ecx
{
 71e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 721:	85 d2                	test   %edx,%edx
 723:	0f 89 7f 00 00 00    	jns    7a8 <printint+0x98>
 729:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 72d:	74 79                	je     7a8 <printint+0x98>
    neg = 1;
 72f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 736:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 738:	31 db                	xor    %ebx,%ebx
 73a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 73d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 740:	89 c8                	mov    %ecx,%eax
 742:	31 d2                	xor    %edx,%edx
 744:	89 cf                	mov    %ecx,%edi
 746:	f7 75 c4             	divl   -0x3c(%ebp)
 749:	0f b6 92 94 0b 00 00 	movzbl 0xb94(%edx),%edx
 750:	89 45 c0             	mov    %eax,-0x40(%ebp)
 753:	89 d8                	mov    %ebx,%eax
 755:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 758:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 75b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 75e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 761:	76 dd                	jbe    740 <printint+0x30>
  if(neg)
 763:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 766:	85 c9                	test   %ecx,%ecx
 768:	74 0c                	je     776 <printint+0x66>
    buf[i++] = '-';
 76a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 76f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 771:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 776:	8b 7d b8             	mov    -0x48(%ebp),%edi
 779:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 77d:	eb 07                	jmp    786 <printint+0x76>
 77f:	90                   	nop
    putc(fd, buf[i]);
 780:	0f b6 13             	movzbl (%ebx),%edx
 783:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 786:	83 ec 04             	sub    $0x4,%esp
 789:	88 55 d7             	mov    %dl,-0x29(%ebp)
 78c:	6a 01                	push   $0x1
 78e:	56                   	push   %esi
 78f:	57                   	push   %edi
 790:	e8 ee fe ff ff       	call   683 <write>
  while(--i >= 0)
 795:	83 c4 10             	add    $0x10,%esp
 798:	39 de                	cmp    %ebx,%esi
 79a:	75 e4                	jne    780 <printint+0x70>
}
 79c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 79f:	5b                   	pop    %ebx
 7a0:	5e                   	pop    %esi
 7a1:	5f                   	pop    %edi
 7a2:	5d                   	pop    %ebp
 7a3:	c3                   	ret    
 7a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 7a8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 7af:	eb 87                	jmp    738 <printint+0x28>
 7b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7bf:	90                   	nop

000007c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 7cc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 7cf:	0f b6 13             	movzbl (%ebx),%edx
 7d2:	84 d2                	test   %dl,%dl
 7d4:	74 6a                	je     840 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 7d6:	8d 45 10             	lea    0x10(%ebp),%eax
 7d9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 7dc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 7df:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 7e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7e4:	eb 36                	jmp    81c <printf+0x5c>
 7e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ed:	8d 76 00             	lea    0x0(%esi),%esi
 7f0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7f3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 7f8:	83 f8 25             	cmp    $0x25,%eax
 7fb:	74 15                	je     812 <printf+0x52>
  write(fd, &c, 1);
 7fd:	83 ec 04             	sub    $0x4,%esp
 800:	88 55 e7             	mov    %dl,-0x19(%ebp)
 803:	6a 01                	push   $0x1
 805:	57                   	push   %edi
 806:	56                   	push   %esi
 807:	e8 77 fe ff ff       	call   683 <write>
 80c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 80f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 812:	0f b6 13             	movzbl (%ebx),%edx
 815:	83 c3 01             	add    $0x1,%ebx
 818:	84 d2                	test   %dl,%dl
 81a:	74 24                	je     840 <printf+0x80>
    c = fmt[i] & 0xff;
 81c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 81f:	85 c9                	test   %ecx,%ecx
 821:	74 cd                	je     7f0 <printf+0x30>
      }
    } else if(state == '%'){
 823:	83 f9 25             	cmp    $0x25,%ecx
 826:	75 ea                	jne    812 <printf+0x52>
      if(c == 'd'){
 828:	83 f8 25             	cmp    $0x25,%eax
 82b:	0f 84 07 01 00 00    	je     938 <printf+0x178>
 831:	83 e8 63             	sub    $0x63,%eax
 834:	83 f8 15             	cmp    $0x15,%eax
 837:	77 17                	ja     850 <printf+0x90>
 839:	ff 24 85 3c 0b 00 00 	jmp    *0xb3c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 840:	8d 65 f4             	lea    -0xc(%ebp),%esp
 843:	5b                   	pop    %ebx
 844:	5e                   	pop    %esi
 845:	5f                   	pop    %edi
 846:	5d                   	pop    %ebp
 847:	c3                   	ret    
 848:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 84f:	90                   	nop
  write(fd, &c, 1);
 850:	83 ec 04             	sub    $0x4,%esp
 853:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 856:	6a 01                	push   $0x1
 858:	57                   	push   %edi
 859:	56                   	push   %esi
 85a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 85e:	e8 20 fe ff ff       	call   683 <write>
        putc(fd, c);
 863:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 867:	83 c4 0c             	add    $0xc,%esp
 86a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 86d:	6a 01                	push   $0x1
 86f:	57                   	push   %edi
 870:	56                   	push   %esi
 871:	e8 0d fe ff ff       	call   683 <write>
        putc(fd, c);
 876:	83 c4 10             	add    $0x10,%esp
      state = 0;
 879:	31 c9                	xor    %ecx,%ecx
 87b:	eb 95                	jmp    812 <printf+0x52>
 87d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 880:	83 ec 0c             	sub    $0xc,%esp
 883:	b9 10 00 00 00       	mov    $0x10,%ecx
 888:	6a 00                	push   $0x0
 88a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 88d:	8b 10                	mov    (%eax),%edx
 88f:	89 f0                	mov    %esi,%eax
 891:	e8 7a fe ff ff       	call   710 <printint>
        ap++;
 896:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 89a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 89d:	31 c9                	xor    %ecx,%ecx
 89f:	e9 6e ff ff ff       	jmp    812 <printf+0x52>
 8a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 8a8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8ab:	8b 10                	mov    (%eax),%edx
        ap++;
 8ad:	83 c0 04             	add    $0x4,%eax
 8b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 8b3:	85 d2                	test   %edx,%edx
 8b5:	0f 84 8d 00 00 00    	je     948 <printf+0x188>
        while(*s != 0){
 8bb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 8be:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 8c0:	84 c0                	test   %al,%al
 8c2:	0f 84 4a ff ff ff    	je     812 <printf+0x52>
 8c8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 8cb:	89 d3                	mov    %edx,%ebx
 8cd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 8d0:	83 ec 04             	sub    $0x4,%esp
          s++;
 8d3:	83 c3 01             	add    $0x1,%ebx
 8d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8d9:	6a 01                	push   $0x1
 8db:	57                   	push   %edi
 8dc:	56                   	push   %esi
 8dd:	e8 a1 fd ff ff       	call   683 <write>
        while(*s != 0){
 8e2:	0f b6 03             	movzbl (%ebx),%eax
 8e5:	83 c4 10             	add    $0x10,%esp
 8e8:	84 c0                	test   %al,%al
 8ea:	75 e4                	jne    8d0 <printf+0x110>
      state = 0;
 8ec:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 8ef:	31 c9                	xor    %ecx,%ecx
 8f1:	e9 1c ff ff ff       	jmp    812 <printf+0x52>
 8f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 900:	83 ec 0c             	sub    $0xc,%esp
 903:	b9 0a 00 00 00       	mov    $0xa,%ecx
 908:	6a 01                	push   $0x1
 90a:	e9 7b ff ff ff       	jmp    88a <printf+0xca>
 90f:	90                   	nop
        putc(fd, *ap);
 910:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 913:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 916:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 918:	6a 01                	push   $0x1
 91a:	57                   	push   %edi
 91b:	56                   	push   %esi
        putc(fd, *ap);
 91c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 91f:	e8 5f fd ff ff       	call   683 <write>
        ap++;
 924:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 928:	83 c4 10             	add    $0x10,%esp
      state = 0;
 92b:	31 c9                	xor    %ecx,%ecx
 92d:	e9 e0 fe ff ff       	jmp    812 <printf+0x52>
 932:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 938:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 93b:	83 ec 04             	sub    $0x4,%esp
 93e:	e9 2a ff ff ff       	jmp    86d <printf+0xad>
 943:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 947:	90                   	nop
          s = "(null)";
 948:	ba 35 0b 00 00       	mov    $0xb35,%edx
        while(*s != 0){
 94d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 950:	b8 28 00 00 00       	mov    $0x28,%eax
 955:	89 d3                	mov    %edx,%ebx
 957:	e9 74 ff ff ff       	jmp    8d0 <printf+0x110>
 95c:	66 90                	xchg   %ax,%ax
 95e:	66 90                	xchg   %ax,%ax

00000960 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 960:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 961:	a1 f4 0e 00 00       	mov    0xef4,%eax
{
 966:	89 e5                	mov    %esp,%ebp
 968:	57                   	push   %edi
 969:	56                   	push   %esi
 96a:	53                   	push   %ebx
 96b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 96e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 971:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 978:	89 c2                	mov    %eax,%edx
 97a:	8b 00                	mov    (%eax),%eax
 97c:	39 ca                	cmp    %ecx,%edx
 97e:	73 30                	jae    9b0 <free+0x50>
 980:	39 c1                	cmp    %eax,%ecx
 982:	72 04                	jb     988 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 984:	39 c2                	cmp    %eax,%edx
 986:	72 f0                	jb     978 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 988:	8b 73 fc             	mov    -0x4(%ebx),%esi
 98b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 98e:	39 f8                	cmp    %edi,%eax
 990:	74 30                	je     9c2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 992:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 995:	8b 42 04             	mov    0x4(%edx),%eax
 998:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 99b:	39 f1                	cmp    %esi,%ecx
 99d:	74 3a                	je     9d9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 99f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 9a1:	5b                   	pop    %ebx
  freep = p;
 9a2:	89 15 f4 0e 00 00    	mov    %edx,0xef4
}
 9a8:	5e                   	pop    %esi
 9a9:	5f                   	pop    %edi
 9aa:	5d                   	pop    %ebp
 9ab:	c3                   	ret    
 9ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9b0:	39 c2                	cmp    %eax,%edx
 9b2:	72 c4                	jb     978 <free+0x18>
 9b4:	39 c1                	cmp    %eax,%ecx
 9b6:	73 c0                	jae    978 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 9b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9be:	39 f8                	cmp    %edi,%eax
 9c0:	75 d0                	jne    992 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 9c2:	03 70 04             	add    0x4(%eax),%esi
 9c5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9c8:	8b 02                	mov    (%edx),%eax
 9ca:	8b 00                	mov    (%eax),%eax
 9cc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 9cf:	8b 42 04             	mov    0x4(%edx),%eax
 9d2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9d5:	39 f1                	cmp    %esi,%ecx
 9d7:	75 c6                	jne    99f <free+0x3f>
    p->s.size += bp->s.size;
 9d9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 9dc:	89 15 f4 0e 00 00    	mov    %edx,0xef4
    p->s.size += bp->s.size;
 9e2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 9e5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 9e8:	89 0a                	mov    %ecx,(%edx)
}
 9ea:	5b                   	pop    %ebx
 9eb:	5e                   	pop    %esi
 9ec:	5f                   	pop    %edi
 9ed:	5d                   	pop    %ebp
 9ee:	c3                   	ret    
 9ef:	90                   	nop

000009f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
 9f3:	57                   	push   %edi
 9f4:	56                   	push   %esi
 9f5:	53                   	push   %ebx
 9f6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9fc:	8b 3d f4 0e 00 00    	mov    0xef4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a02:	8d 70 07             	lea    0x7(%eax),%esi
 a05:	c1 ee 03             	shr    $0x3,%esi
 a08:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a0b:	85 ff                	test   %edi,%edi
 a0d:	0f 84 9d 00 00 00    	je     ab0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a13:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 a15:	8b 4a 04             	mov    0x4(%edx),%ecx
 a18:	39 f1                	cmp    %esi,%ecx
 a1a:	73 6a                	jae    a86 <malloc+0x96>
 a1c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a21:	39 de                	cmp    %ebx,%esi
 a23:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a26:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a2d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a30:	eb 17                	jmp    a49 <malloc+0x59>
 a32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a38:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a3a:	8b 48 04             	mov    0x4(%eax),%ecx
 a3d:	39 f1                	cmp    %esi,%ecx
 a3f:	73 4f                	jae    a90 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a41:	8b 3d f4 0e 00 00    	mov    0xef4,%edi
 a47:	89 c2                	mov    %eax,%edx
 a49:	39 d7                	cmp    %edx,%edi
 a4b:	75 eb                	jne    a38 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 a4d:	83 ec 0c             	sub    $0xc,%esp
 a50:	ff 75 e4             	push   -0x1c(%ebp)
 a53:	e8 93 fc ff ff       	call   6eb <sbrk>
  if(p == (char*)-1)
 a58:	83 c4 10             	add    $0x10,%esp
 a5b:	83 f8 ff             	cmp    $0xffffffff,%eax
 a5e:	74 1c                	je     a7c <malloc+0x8c>
  hp->s.size = nu;
 a60:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a63:	83 ec 0c             	sub    $0xc,%esp
 a66:	83 c0 08             	add    $0x8,%eax
 a69:	50                   	push   %eax
 a6a:	e8 f1 fe ff ff       	call   960 <free>
  return freep;
 a6f:	8b 15 f4 0e 00 00    	mov    0xef4,%edx
      if((p = morecore(nunits)) == 0)
 a75:	83 c4 10             	add    $0x10,%esp
 a78:	85 d2                	test   %edx,%edx
 a7a:	75 bc                	jne    a38 <malloc+0x48>
        return 0;
  }
}
 a7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a7f:	31 c0                	xor    %eax,%eax
}
 a81:	5b                   	pop    %ebx
 a82:	5e                   	pop    %esi
 a83:	5f                   	pop    %edi
 a84:	5d                   	pop    %ebp
 a85:	c3                   	ret    
    if(p->s.size >= nunits){
 a86:	89 d0                	mov    %edx,%eax
 a88:	89 fa                	mov    %edi,%edx
 a8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a90:	39 ce                	cmp    %ecx,%esi
 a92:	74 4c                	je     ae0 <malloc+0xf0>
        p->s.size -= nunits;
 a94:	29 f1                	sub    %esi,%ecx
 a96:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a99:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a9c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 a9f:	89 15 f4 0e 00 00    	mov    %edx,0xef4
}
 aa5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 aa8:	83 c0 08             	add    $0x8,%eax
}
 aab:	5b                   	pop    %ebx
 aac:	5e                   	pop    %esi
 aad:	5f                   	pop    %edi
 aae:	5d                   	pop    %ebp
 aaf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 ab0:	c7 05 f4 0e 00 00 f8 	movl   $0xef8,0xef4
 ab7:	0e 00 00 
    base.s.size = 0;
 aba:	bf f8 0e 00 00       	mov    $0xef8,%edi
    base.s.ptr = freep = prevp = &base;
 abf:	c7 05 f8 0e 00 00 f8 	movl   $0xef8,0xef8
 ac6:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 acb:	c7 05 fc 0e 00 00 00 	movl   $0x0,0xefc
 ad2:	00 00 00 
    if(p->s.size >= nunits){
 ad5:	e9 42 ff ff ff       	jmp    a1c <malloc+0x2c>
 ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 ae0:	8b 08                	mov    (%eax),%ecx
 ae2:	89 0a                	mov    %ecx,(%edx)
 ae4:	eb b9                	jmp    a9f <malloc+0xaf>
