
_uniq:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    }
}

// i took this main function from the cat program as a base, and edited to fit our needs
int main(int argc, char *argv[])
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
  15:	83 ec 18             	sub    $0x18,%esp
  18:	8b 41 04             	mov    0x4(%ecx),%eax
  1b:	8b 31                	mov    (%ecx),%esi
  1d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    int fd, i;
    char *arg;
    char *filename = 0;
    int flag = 0; // no flag

    if (argc == 1)
  20:	83 fe 01             	cmp    $0x1,%esi
  23:	0f 84 ae 00 00 00    	je     d7 <main+0xd7>
        // read from stdin
        uniq(0, flag);
        exit();
    }

    for (i = 1; i < argc; i++)
  29:	0f 8e 97 00 00 00    	jle    c6 <main+0xc6>
  2f:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    char *filename = 0;
  32:	31 ff                	xor    %edi,%edi
  34:	8d 43 04             	lea    0x4(%ebx),%eax
  37:	8d 0c b3             	lea    (%ebx,%esi,4),%ecx
    int flag = 0; // no flag
  3a:	31 db                	xor    %ebx,%ebx
  3c:	eb 0b                	jmp    49 <main+0x49>
  3e:	66 90                	xchg   %ax,%ax
  40:	89 d7                	mov    %edx,%edi
    for (i = 1; i < argc; i++)
  42:	83 c0 04             	add    $0x4,%eax
  45:	39 c8                	cmp    %ecx,%eax
  47:	74 27                	je     70 <main+0x70>
    {
        arg = argv[i];
  49:	8b 10                	mov    (%eax),%edx
        if (*arg == '-')
  4b:	80 3a 2d             	cmpb   $0x2d,(%edx)
  4e:	75 f0                	jne    40 <main+0x40>
        {
            arg++;
            char letter = *arg;
  50:	0f b6 52 01          	movzbl 0x1(%edx),%edx
            switch (letter)
  54:	80 fa 64             	cmp    $0x64,%dl
  57:	74 4e                	je     a7 <main+0xa7>
  59:	80 fa 69             	cmp    $0x69,%dl
  5c:	74 42                	je     a0 <main+0xa0>
  5e:	80 fa 63             	cmp    $0x63,%dl
  61:	ba 02 00 00 00       	mov    $0x2,%edx
  66:	0f 44 da             	cmove  %edx,%ebx
    for (i = 1; i < argc; i++)
  69:	83 c0 04             	add    $0x4,%eax
  6c:	39 c8                	cmp    %ecx,%eax
  6e:	75 d9                	jne    49 <main+0x49>
        else
        {
            filename = argv[i];
        }
    }
    if (filename)
  70:	85 ff                	test   %edi,%edi
  72:	74 54                	je     c8 <main+0xc8>
    {
        if ((fd = open(filename, 0)) < 0)
  74:	50                   	push   %eax
  75:	50                   	push   %eax
  76:	6a 00                	push   $0x0
  78:	57                   	push   %edi
  79:	e8 15 06 00 00       	call   693 <open>
  7e:	83 c4 10             	add    $0x10,%esp
  81:	89 c7                	mov    %eax,%edi
  83:	85 c0                	test   %eax,%eax
  85:	78 27                	js     ae <main+0xae>
        {
            printf(1, "uniq: cannot open %s\n", argv[i]);
            exit();
        }
        uniq(fd, flag);
  87:	52                   	push   %edx
  88:	52                   	push   %edx
  89:	53                   	push   %ebx
  8a:	50                   	push   %eax
  8b:	e8 e0 01 00 00       	call   270 <uniq>
        close(fd);
  90:	89 3c 24             	mov    %edi,(%esp)
  93:	e8 e3 05 00 00       	call   67b <close>
        exit();
  98:	e8 b6 05 00 00       	call   653 <exit>
  9d:	8d 76 00             	lea    0x0(%esi),%esi
                flag = I;
  a0:	bb 01 00 00 00       	mov    $0x1,%ebx
  a5:	eb 9b                	jmp    42 <main+0x42>
                flag = D;
  a7:	bb 03 00 00 00       	mov    $0x3,%ebx
  ac:	eb 94                	jmp    42 <main+0x42>
            printf(1, "uniq: cannot open %s\n", argv[i]);
  ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  b1:	51                   	push   %ecx
  b2:	ff 34 b0             	push   (%eax,%esi,4)
  b5:	68 1f 0b 00 00       	push   $0xb1f
  ba:	6a 01                	push   $0x1
  bc:	e8 ef 06 00 00       	call   7b0 <printf>
            exit();
  c1:	e8 8d 05 00 00       	call   653 <exit>
    int flag = 0; // no flag
  c6:	31 db                	xor    %ebx,%ebx
    }
    else
    {
        // stdin
        uniq(0, flag);
  c8:	50                   	push   %eax
  c9:	50                   	push   %eax
  ca:	53                   	push   %ebx
  cb:	6a 00                	push   $0x0
  cd:	e8 9e 01 00 00       	call   270 <uniq>
        exit();
  d2:	e8 7c 05 00 00       	call   653 <exit>
        uniq(0, flag);
  d7:	50                   	push   %eax
  d8:	50                   	push   %eax
  d9:	6a 00                	push   $0x0
  db:	6a 00                	push   $0x0
  dd:	e8 8e 01 00 00       	call   270 <uniq>
        exit();
  e2:	e8 6c 05 00 00       	call   653 <exit>
  e7:	66 90                	xchg   %ax,%ax
  e9:	66 90                	xchg   %ax,%ax
  eb:	66 90                	xchg   %ax,%ax
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <line_compare.part.0>:
int line_compare(char *line1, char *line2, int flag)
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	56                   	push   %esi
  f5:	53                   	push   %ebx
  f6:	81 ec 1c 04 00 00    	sub    $0x41c,%esp
        while (*line1 != '\0' && index < MAX_LINE-1) {
  fc:	0f b6 08             	movzbl (%eax),%ecx
int line_compare(char *line1, char *line2, int flag)
  ff:	89 95 e0 fb ff ff    	mov    %edx,-0x420(%ebp)
        while (*line1 != '\0' && index < MAX_LINE-1) {
 105:	84 c9                	test   %cl,%cl
 107:	0f 84 95 00 00 00    	je     1a2 <line_compare.part.0+0xb2>
 10d:	89 c3                	mov    %eax,%ebx
 10f:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
 115:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
        int index = 0;
 11b:	31 d2                	xor    %edx,%edx
 11d:	89 85 e4 fb ff ff    	mov    %eax,-0x41c(%ebp)
 123:	89 9d dc fb ff ff    	mov    %ebx,-0x424(%ebp)
 129:	eb 0d                	jmp    138 <line_compare.part.0+0x48>
 12b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        while (*line1 != '\0' && index < MAX_LINE-1) {
 130:	81 fa ff 01 00 00    	cmp    $0x1ff,%edx
 136:	74 43                	je     17b <line_compare.part.0+0x8b>
    if (c >= 'A' && c <= 'Z')
 138:	8d 79 bf             	lea    -0x41(%ecx),%edi
        return c + 32;
 13b:	8d 41 20             	lea    0x20(%ecx),%eax
 13e:	89 fb                	mov    %edi,%ebx
 140:	80 fb 1a             	cmp    $0x1a,%bl
 143:	0f 42 c8             	cmovb  %eax,%ecx
            lower_line1[index] = to_lower(*line1);
 146:	8b 85 e4 fb ff ff    	mov    -0x41c(%ebp),%eax
 14c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
            lower_line2[index] = to_lower(*line2);
 14f:	8b 85 e0 fb ff ff    	mov    -0x420(%ebp),%eax
 155:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
    if (c >= 'A' && c <= 'Z')
 159:	8d 78 bf             	lea    -0x41(%eax),%edi
        return c + 32;
 15c:	8d 48 20             	lea    0x20(%eax),%ecx
 15f:	89 fb                	mov    %edi,%ebx
 161:	80 fb 1a             	cmp    $0x1a,%bl
 164:	0f 42 c1             	cmovb  %ecx,%eax
            lower_line2[index] = to_lower(*line2);
 167:	88 04 16             	mov    %al,(%esi,%edx,1)
        while (*line1 != '\0' && index < MAX_LINE-1) {
 16a:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
            index++;
 170:	83 c2 01             	add    $0x1,%edx
        while (*line1 != '\0' && index < MAX_LINE-1) {
 173:	0f b6 0c 10          	movzbl (%eax,%edx,1),%ecx
 177:	84 c9                	test   %cl,%cl
 179:	75 b5                	jne    130 <line_compare.part.0+0x40>
        return strcmp(lower_line1, lower_line2);
 17b:	83 ec 08             	sub    $0x8,%esp
        lower_line1[index] = '\0';
 17e:	c6 84 15 e8 fb ff ff 	movb   $0x0,-0x418(%ebp,%edx,1)
 185:	00 
        return strcmp(lower_line1, lower_line2);
 186:	56                   	push   %esi
 187:	ff b5 e4 fb ff ff    	push   -0x41c(%ebp)
        lower_line2[index] = '\0';
 18d:	c6 84 15 e8 fd ff ff 	movb   $0x0,-0x218(%ebp,%edx,1)
 194:	00 
        return strcmp(lower_line1, lower_line2);
 195:	e8 86 02 00 00       	call   420 <strcmp>
}
 19a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 19d:	5b                   	pop    %ebx
 19e:	5e                   	pop    %esi
 19f:	5f                   	pop    %edi
 1a0:	5d                   	pop    %ebp
 1a1:	c3                   	ret
 1a2:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
        int index = 0;
 1a8:	31 d2                	xor    %edx,%edx
 1aa:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
 1b0:	89 85 e4 fb ff ff    	mov    %eax,-0x41c(%ebp)
 1b6:	eb c3                	jmp    17b <line_compare.part.0+0x8b>
 1b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1bf:	00 

000001c0 <to_lower>:
{
 1c0:	f3 0f 1e fb          	endbr32
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ca:	5d                   	pop    %ebp
    if (c >= 'A' && c <= 'Z')
 1cb:	8d 48 bf             	lea    -0x41(%eax),%ecx
        return c + 32;
 1ce:	8d 50 20             	lea    0x20(%eax),%edx
 1d1:	80 f9 1a             	cmp    $0x1a,%cl
 1d4:	0f 42 c2             	cmovb  %edx,%eax
}
 1d7:	c3                   	ret
 1d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1df:	00 

000001e0 <line_compare>:
{
 1e0:	f3 0f 1e fb          	endbr32
 1e4:	55                   	push   %ebp
 1e5:	89 e5                	mov    %esp,%ebp
    if (flag == I)
 1e7:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
{
 1eb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ee:	8b 55 0c             	mov    0xc(%ebp),%edx
    if (flag == I)
 1f1:	75 0d                	jne    200 <line_compare+0x20>
}
 1f3:	5d                   	pop    %ebp
 1f4:	e9 f7 fe ff ff       	jmp    f0 <line_compare.part.0>
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	5d                   	pop    %ebp
        return strcmp(line1, line2);
 201:	e9 1a 02 00 00       	jmp    420 <strcmp>
 206:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 20d:	00 
 20e:	66 90                	xchg   %ax,%ax

00000210 <printuniqueline>:
{
 210:	f3 0f 1e fb          	endbr32
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	83 ec 08             	sub    $0x8,%esp
 21a:	8b 45 10             	mov    0x10(%ebp),%eax
 21d:	8b 55 08             	mov    0x8(%ebp),%edx
 220:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    if (flag == C)
 223:	83 f8 02             	cmp    $0x2,%eax
 226:	74 28                	je     250 <printuniqueline+0x40>
    else if (flag == D)
 228:	83 f8 03             	cmp    $0x3,%eax
 22b:	75 0b                	jne    238 <printuniqueline+0x28>
        if (count > 1)
 22d:	83 f9 01             	cmp    $0x1,%ecx
 230:	7f 06                	jg     238 <printuniqueline+0x28>
}
 232:	c9                   	leave
 233:	c3                   	ret
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            printf(1, "%s\n", line);
 238:	89 55 10             	mov    %edx,0x10(%ebp)
 23b:	c7 45 0c 1b 0b 00 00 	movl   $0xb1b,0xc(%ebp)
 242:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 249:	c9                   	leave
            printf(1, "%s\n", line);
 24a:	e9 61 05 00 00       	jmp    7b0 <printf>
 24f:	90                   	nop
        printf(1, "%d %s\n", count, line);
 250:	52                   	push   %edx
 251:	51                   	push   %ecx
 252:	68 18 0b 00 00       	push   $0xb18
 257:	6a 01                	push   $0x1
 259:	e8 52 05 00 00       	call   7b0 <printf>
 25e:	83 c4 10             	add    $0x10,%esp
}
 261:	c9                   	leave
 262:	c3                   	ret
 263:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 26a:	00 
 26b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000270 <uniq>:
{
 270:	f3 0f 1e fb          	endbr32
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	57                   	push   %edi
    int index = 0;
 278:	31 ff                	xor    %edi,%edi
{
 27a:	56                   	push   %esi
 27b:	53                   	push   %ebx
 27c:	8d 9d e7 fb ff ff    	lea    -0x419(%ebp),%ebx
 282:	81 ec 2c 04 00 00    	sub    $0x42c,%esp
 288:	8b 75 08             	mov    0x8(%ebp),%esi
    int lastcount = 1; // once repeated line
 28b:	c7 85 d4 fb ff ff 01 	movl   $0x1,-0x42c(%ebp)
 292:	00 00 00 
 295:	8d 76 00             	lea    0x0(%esi),%esi
    while (read(fd, buf, 1) == 1)
 298:	83 ec 04             	sub    $0x4,%esp
 29b:	6a 01                	push   $0x1
 29d:	53                   	push   %ebx
 29e:	56                   	push   %esi
 29f:	e8 c7 03 00 00       	call   66b <read>
 2a4:	83 c4 10             	add    $0x10,%esp
 2a7:	83 f8 01             	cmp    $0x1,%eax
 2aa:	0f 85 90 00 00 00    	jne    340 <uniq+0xd0>
        if (buf[0] == '\n' || index == MAX_LINE - 1)
 2b0:	0f b6 85 e7 fb ff ff 	movzbl -0x419(%ebp),%eax
 2b7:	81 ff ff 01 00 00    	cmp    $0x1ff,%edi
 2bd:	74 11                	je     2d0 <uniq+0x60>
 2bf:	3c 0a                	cmp    $0xa,%al
 2c1:	74 0d                	je     2d0 <uniq+0x60>
            line[index++] = buf[0];        // add another char to our line
 2c3:	88 84 3d e8 fb ff ff 	mov    %al,-0x418(%ebp,%edi,1)
 2ca:	83 c7 01             	add    $0x1,%edi
 2cd:	eb c9                	jmp    298 <uniq+0x28>
 2cf:	90                   	nop
            if (line_compare(line, lastline, flag) != 0)
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 2d9:	ff 75 0c             	push   0xc(%ebp)
 2dc:	50                   	push   %eax
 2dd:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
 2e3:	50                   	push   %eax
            line[index] = '\0'; // null terminates (so that trailing characters wont get leftover)
 2e4:	c6 84 3d e8 fb ff ff 	movb   $0x0,-0x418(%ebp,%edi,1)
 2eb:	00 
            if (line_compare(line, lastline, flag) != 0)
 2ec:	e8 ef fe ff ff       	call   1e0 <line_compare>
 2f1:	83 c4 10             	add    $0x10,%esp
 2f4:	89 c7                	mov    %eax,%edi
 2f6:	85 c0                	test   %eax,%eax
 2f8:	74 36                	je     330 <uniq+0xc0>
                if (*lastline != '\0')
 2fa:	80 bd e8 fd ff ff 00 	cmpb   $0x0,-0x218(%ebp)
 301:	75 4d                	jne    350 <uniq+0xe0>
                strcpy(lastline, line);                         // reset last line to start the count over
 303:	83 ec 08             	sub    $0x8,%esp
 306:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
            index = 0;
 30c:	31 ff                	xor    %edi,%edi
                strcpy(lastline, line);                         // reset last line to start the count over
 30e:	50                   	push   %eax
 30f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 315:	50                   	push   %eax
 316:	e8 d5 00 00 00       	call   3f0 <strcpy>
                lastcount = 1;
 31b:	83 c4 10             	add    $0x10,%esp
 31e:	c7 85 d4 fb ff ff 01 	movl   $0x1,-0x42c(%ebp)
 325:	00 00 00 
 328:	e9 6b ff ff ff       	jmp    298 <uniq+0x28>
 32d:	8d 76 00             	lea    0x0(%esi),%esi
                lastcount++;
 330:	83 85 d4 fb ff ff 01 	addl   $0x1,-0x42c(%ebp)
 337:	e9 5c ff ff ff       	jmp    298 <uniq+0x28>
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (index > 0)
 340:	85 ff                	test   %edi,%edi
 342:	75 2c                	jne    370 <uniq+0x100>
}
 344:	8d 65 f4             	lea    -0xc(%ebp),%esp
 347:	5b                   	pop    %ebx
 348:	5e                   	pop    %esi
 349:	5f                   	pop    %edi
 34a:	5d                   	pop    %ebp
 34b:	c3                   	ret
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                    printuniqueline(lastline, lastcount, flag); // print last line
 350:	83 ec 04             	sub    $0x4,%esp
 353:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 359:	ff 75 0c             	push   0xc(%ebp)
 35c:	ff b5 d4 fb ff ff    	push   -0x42c(%ebp)
 362:	50                   	push   %eax
 363:	e8 a8 fe ff ff       	call   210 <printuniqueline>
 368:	83 c4 10             	add    $0x10,%esp
 36b:	eb 96                	jmp    303 <uniq+0x93>
 36d:	8d 76 00             	lea    0x0(%esi),%esi
        if (line_compare(line, lastline, flag) != 0)
 370:	83 ec 04             	sub    $0x4,%esp
 373:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
 379:	8d 9d e8 fb ff ff    	lea    -0x418(%ebp),%ebx
 37f:	ff 75 0c             	push   0xc(%ebp)
 382:	56                   	push   %esi
 383:	53                   	push   %ebx
        line[index] = '\0';
 384:	c6 84 3d e8 fb ff ff 	movb   $0x0,-0x418(%ebp,%edi,1)
 38b:	00 
        if (line_compare(line, lastline, flag) != 0)
 38c:	e8 4f fe ff ff       	call   1e0 <line_compare>
 391:	83 c4 10             	add    $0x10,%esp
 394:	85 c0                	test   %eax,%eax
 396:	74 30                	je     3c8 <uniq+0x158>
            printuniqueline(lastline, lastcount, flag);
 398:	83 ec 04             	sub    $0x4,%esp
 39b:	ff 75 0c             	push   0xc(%ebp)
 39e:	ff b5 d4 fb ff ff    	push   -0x42c(%ebp)
 3a4:	56                   	push   %esi
 3a5:	e8 66 fe ff ff       	call   210 <printuniqueline>
            printuniqueline(line, lastcount, flag);
 3aa:	83 c4 0c             	add    $0xc,%esp
 3ad:	ff 75 0c             	push   0xc(%ebp)
 3b0:	6a 01                	push   $0x1
 3b2:	53                   	push   %ebx
 3b3:	e8 58 fe ff ff       	call   210 <printuniqueline>
 3b8:	83 c4 10             	add    $0x10,%esp
}
 3bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3be:	5b                   	pop    %ebx
 3bf:	5e                   	pop    %esi
 3c0:	5f                   	pop    %edi
 3c1:	5d                   	pop    %ebp
 3c2:	c3                   	ret
 3c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
            lastcount++;
 3c8:	8b 85 d4 fb ff ff    	mov    -0x42c(%ebp),%eax
            printuniqueline(line, lastcount, flag); // print last line
 3ce:	83 ec 04             	sub    $0x4,%esp
 3d1:	ff 75 0c             	push   0xc(%ebp)
            lastcount++;
 3d4:	83 c0 01             	add    $0x1,%eax
            printuniqueline(line, lastcount, flag); // print last line
 3d7:	50                   	push   %eax
 3d8:	53                   	push   %ebx
 3d9:	e8 32 fe ff ff       	call   210 <printuniqueline>
 3de:	83 c4 10             	add    $0x10,%esp
}
 3e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3e4:	5b                   	pop    %ebx
 3e5:	5e                   	pop    %esi
 3e6:	5f                   	pop    %edi
 3e7:	5d                   	pop    %ebp
 3e8:	c3                   	ret
 3e9:	66 90                	xchg   %ax,%ax
 3eb:	66 90                	xchg   %ax,%ax
 3ed:	66 90                	xchg   %ax,%ax
 3ef:	90                   	nop

000003f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 3f0:	f3 0f 1e fb          	endbr32
 3f4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3f5:	31 c0                	xor    %eax,%eax
{
 3f7:	89 e5                	mov    %esp,%ebp
 3f9:	53                   	push   %ebx
 3fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3fd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 400:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 404:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 407:	83 c0 01             	add    $0x1,%eax
 40a:	84 d2                	test   %dl,%dl
 40c:	75 f2                	jne    400 <strcpy+0x10>
    ;
  return os;
}
 40e:	89 c8                	mov    %ecx,%eax
 410:	5b                   	pop    %ebx
 411:	5d                   	pop    %ebp
 412:	c3                   	ret
 413:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 41a:	00 
 41b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000420 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 420:	f3 0f 1e fb          	endbr32
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	53                   	push   %ebx
 428:	8b 4d 08             	mov    0x8(%ebp),%ecx
 42b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 42e:	0f b6 01             	movzbl (%ecx),%eax
 431:	0f b6 1a             	movzbl (%edx),%ebx
 434:	84 c0                	test   %al,%al
 436:	75 19                	jne    451 <strcmp+0x31>
 438:	eb 26                	jmp    460 <strcmp+0x40>
 43a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 440:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 444:	83 c1 01             	add    $0x1,%ecx
 447:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 44a:	0f b6 1a             	movzbl (%edx),%ebx
 44d:	84 c0                	test   %al,%al
 44f:	74 0f                	je     460 <strcmp+0x40>
 451:	38 d8                	cmp    %bl,%al
 453:	74 eb                	je     440 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 455:	29 d8                	sub    %ebx,%eax
}
 457:	5b                   	pop    %ebx
 458:	5d                   	pop    %ebp
 459:	c3                   	ret
 45a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 460:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 462:	29 d8                	sub    %ebx,%eax
}
 464:	5b                   	pop    %ebx
 465:	5d                   	pop    %ebp
 466:	c3                   	ret
 467:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 46e:	00 
 46f:	90                   	nop

00000470 <strlen>:

uint
strlen(const char *s)
{
 470:	f3 0f 1e fb          	endbr32
 474:	55                   	push   %ebp
 475:	89 e5                	mov    %esp,%ebp
 477:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 47a:	80 3a 00             	cmpb   $0x0,(%edx)
 47d:	74 21                	je     4a0 <strlen+0x30>
 47f:	31 c0                	xor    %eax,%eax
 481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 488:	83 c0 01             	add    $0x1,%eax
 48b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 48f:	89 c1                	mov    %eax,%ecx
 491:	75 f5                	jne    488 <strlen+0x18>
    ;
  return n;
}
 493:	89 c8                	mov    %ecx,%eax
 495:	5d                   	pop    %ebp
 496:	c3                   	ret
 497:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 49e:	00 
 49f:	90                   	nop
  for(n = 0; s[n]; n++)
 4a0:	31 c9                	xor    %ecx,%ecx
}
 4a2:	5d                   	pop    %ebp
 4a3:	89 c8                	mov    %ecx,%eax
 4a5:	c3                   	ret
 4a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4ad:	00 
 4ae:	66 90                	xchg   %ax,%ax

000004b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4b0:	f3 0f 1e fb          	endbr32
 4b4:	55                   	push   %ebp
 4b5:	89 e5                	mov    %esp,%ebp
 4b7:	57                   	push   %edi
 4b8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4bb:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4be:	8b 45 0c             	mov    0xc(%ebp),%eax
 4c1:	89 d7                	mov    %edx,%edi
 4c3:	fc                   	cld
 4c4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4c6:	89 d0                	mov    %edx,%eax
 4c8:	5f                   	pop    %edi
 4c9:	5d                   	pop    %ebp
 4ca:	c3                   	ret
 4cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000004d0 <strchr>:

char*
strchr(const char *s, char c)
{
 4d0:	f3 0f 1e fb          	endbr32
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	8b 45 08             	mov    0x8(%ebp),%eax
 4da:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4de:	0f b6 10             	movzbl (%eax),%edx
 4e1:	84 d2                	test   %dl,%dl
 4e3:	75 16                	jne    4fb <strchr+0x2b>
 4e5:	eb 21                	jmp    508 <strchr+0x38>
 4e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4ee:	00 
 4ef:	90                   	nop
 4f0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 4f4:	83 c0 01             	add    $0x1,%eax
 4f7:	84 d2                	test   %dl,%dl
 4f9:	74 0d                	je     508 <strchr+0x38>
    if(*s == c)
 4fb:	38 d1                	cmp    %dl,%cl
 4fd:	75 f1                	jne    4f0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 4ff:	5d                   	pop    %ebp
 500:	c3                   	ret
 501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 508:	31 c0                	xor    %eax,%eax
}
 50a:	5d                   	pop    %ebp
 50b:	c3                   	ret
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000510 <gets>:

char*
gets(char *buf, int max)
{
 510:	f3 0f 1e fb          	endbr32
 514:	55                   	push   %ebp
 515:	89 e5                	mov    %esp,%ebp
 517:	57                   	push   %edi
 518:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 519:	31 f6                	xor    %esi,%esi
{
 51b:	53                   	push   %ebx
 51c:	89 f3                	mov    %esi,%ebx
 51e:	83 ec 1c             	sub    $0x1c,%esp
 521:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 524:	eb 33                	jmp    559 <gets+0x49>
 526:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 52d:	00 
 52e:	66 90                	xchg   %ax,%ax
    cc = read(0, &c, 1);
 530:	83 ec 04             	sub    $0x4,%esp
 533:	8d 45 e7             	lea    -0x19(%ebp),%eax
 536:	6a 01                	push   $0x1
 538:	50                   	push   %eax
 539:	6a 00                	push   $0x0
 53b:	e8 2b 01 00 00       	call   66b <read>
    if(cc < 1)
 540:	83 c4 10             	add    $0x10,%esp
 543:	85 c0                	test   %eax,%eax
 545:	7e 1c                	jle    563 <gets+0x53>
      break;
    buf[i++] = c;
 547:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 54b:	83 c7 01             	add    $0x1,%edi
 54e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 551:	3c 0a                	cmp    $0xa,%al
 553:	74 23                	je     578 <gets+0x68>
 555:	3c 0d                	cmp    $0xd,%al
 557:	74 1f                	je     578 <gets+0x68>
  for(i=0; i+1 < max; ){
 559:	83 c3 01             	add    $0x1,%ebx
 55c:	89 fe                	mov    %edi,%esi
 55e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 561:	7c cd                	jl     530 <gets+0x20>
 563:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 565:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 568:	c6 03 00             	movb   $0x0,(%ebx)
}
 56b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 56e:	5b                   	pop    %ebx
 56f:	5e                   	pop    %esi
 570:	5f                   	pop    %edi
 571:	5d                   	pop    %ebp
 572:	c3                   	ret
 573:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 578:	8b 75 08             	mov    0x8(%ebp),%esi
 57b:	8b 45 08             	mov    0x8(%ebp),%eax
 57e:	01 de                	add    %ebx,%esi
 580:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 582:	c6 03 00             	movb   $0x0,(%ebx)
}
 585:	8d 65 f4             	lea    -0xc(%ebp),%esp
 588:	5b                   	pop    %ebx
 589:	5e                   	pop    %esi
 58a:	5f                   	pop    %edi
 58b:	5d                   	pop    %ebp
 58c:	c3                   	ret
 58d:	8d 76 00             	lea    0x0(%esi),%esi

00000590 <stat>:

int
stat(const char *n, struct stat *st)
{
 590:	f3 0f 1e fb          	endbr32
 594:	55                   	push   %ebp
 595:	89 e5                	mov    %esp,%ebp
 597:	56                   	push   %esi
 598:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 599:	83 ec 08             	sub    $0x8,%esp
 59c:	6a 00                	push   $0x0
 59e:	ff 75 08             	push   0x8(%ebp)
 5a1:	e8 ed 00 00 00       	call   693 <open>
  if(fd < 0)
 5a6:	83 c4 10             	add    $0x10,%esp
 5a9:	85 c0                	test   %eax,%eax
 5ab:	78 2b                	js     5d8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 5ad:	83 ec 08             	sub    $0x8,%esp
 5b0:	ff 75 0c             	push   0xc(%ebp)
 5b3:	89 c3                	mov    %eax,%ebx
 5b5:	50                   	push   %eax
 5b6:	e8 f0 00 00 00       	call   6ab <fstat>
  close(fd);
 5bb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 5be:	89 c6                	mov    %eax,%esi
  close(fd);
 5c0:	e8 b6 00 00 00       	call   67b <close>
  return r;
 5c5:	83 c4 10             	add    $0x10,%esp
}
 5c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5cb:	89 f0                	mov    %esi,%eax
 5cd:	5b                   	pop    %ebx
 5ce:	5e                   	pop    %esi
 5cf:	5d                   	pop    %ebp
 5d0:	c3                   	ret
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 5d8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5dd:	eb e9                	jmp    5c8 <stat+0x38>
 5df:	90                   	nop

000005e0 <atoi>:

int
atoi(const char *s)
{
 5e0:	f3 0f 1e fb          	endbr32
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
 5e7:	53                   	push   %ebx
 5e8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5eb:	0f be 02             	movsbl (%edx),%eax
 5ee:	8d 48 d0             	lea    -0x30(%eax),%ecx
 5f1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 5f4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 5f9:	77 1a                	ja     615 <atoi+0x35>
 5fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 600:	83 c2 01             	add    $0x1,%edx
 603:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 606:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 60a:	0f be 02             	movsbl (%edx),%eax
 60d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 610:	80 fb 09             	cmp    $0x9,%bl
 613:	76 eb                	jbe    600 <atoi+0x20>
  return n;
}
 615:	89 c8                	mov    %ecx,%eax
 617:	5b                   	pop    %ebx
 618:	5d                   	pop    %ebp
 619:	c3                   	ret
 61a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000620 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 620:	f3 0f 1e fb          	endbr32
 624:	55                   	push   %ebp
 625:	89 e5                	mov    %esp,%ebp
 627:	57                   	push   %edi
 628:	8b 45 10             	mov    0x10(%ebp),%eax
 62b:	8b 55 08             	mov    0x8(%ebp),%edx
 62e:	56                   	push   %esi
 62f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 632:	85 c0                	test   %eax,%eax
 634:	7e 0f                	jle    645 <memmove+0x25>
 636:	01 d0                	add    %edx,%eax
  dst = vdst;
 638:	89 d7                	mov    %edx,%edi
 63a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 640:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 641:	39 f8                	cmp    %edi,%eax
 643:	75 fb                	jne    640 <memmove+0x20>
  return vdst;
}
 645:	5e                   	pop    %esi
 646:	89 d0                	mov    %edx,%eax
 648:	5f                   	pop    %edi
 649:	5d                   	pop    %ebp
 64a:	c3                   	ret

0000064b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 64b:	b8 01 00 00 00       	mov    $0x1,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret

00000653 <exit>:
SYSCALL(exit)
 653:	b8 02 00 00 00       	mov    $0x2,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret

0000065b <wait>:
SYSCALL(wait)
 65b:	b8 03 00 00 00       	mov    $0x3,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret

00000663 <pipe>:
SYSCALL(pipe)
 663:	b8 04 00 00 00       	mov    $0x4,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret

0000066b <read>:
SYSCALL(read)
 66b:	b8 05 00 00 00       	mov    $0x5,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret

00000673 <write>:
SYSCALL(write)
 673:	b8 10 00 00 00       	mov    $0x10,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret

0000067b <close>:
SYSCALL(close)
 67b:	b8 15 00 00 00       	mov    $0x15,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret

00000683 <kill>:
SYSCALL(kill)
 683:	b8 06 00 00 00       	mov    $0x6,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret

0000068b <exec>:
SYSCALL(exec)
 68b:	b8 07 00 00 00       	mov    $0x7,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret

00000693 <open>:
SYSCALL(open)
 693:	b8 0f 00 00 00       	mov    $0xf,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret

0000069b <mknod>:
SYSCALL(mknod)
 69b:	b8 11 00 00 00       	mov    $0x11,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret

000006a3 <unlink>:
SYSCALL(unlink)
 6a3:	b8 12 00 00 00       	mov    $0x12,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret

000006ab <fstat>:
SYSCALL(fstat)
 6ab:	b8 08 00 00 00       	mov    $0x8,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret

000006b3 <link>:
SYSCALL(link)
 6b3:	b8 13 00 00 00       	mov    $0x13,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret

000006bb <mkdir>:
SYSCALL(mkdir)
 6bb:	b8 14 00 00 00       	mov    $0x14,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret

000006c3 <chdir>:
SYSCALL(chdir)
 6c3:	b8 09 00 00 00       	mov    $0x9,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret

000006cb <dup>:
SYSCALL(dup)
 6cb:	b8 0a 00 00 00       	mov    $0xa,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret

000006d3 <getpid>:
SYSCALL(getpid)
 6d3:	b8 0b 00 00 00       	mov    $0xb,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret

000006db <sbrk>:
SYSCALL(sbrk)
 6db:	b8 0c 00 00 00       	mov    $0xc,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret

000006e3 <sleep>:
SYSCALL(sleep)
 6e3:	b8 0d 00 00 00       	mov    $0xd,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret

000006eb <uptime>:
SYSCALL(uptime)
 6eb:	b8 0e 00 00 00       	mov    $0xe,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret
 6f3:	66 90                	xchg   %ax,%ax
 6f5:	66 90                	xchg   %ax,%ax
 6f7:	66 90                	xchg   %ax,%ax
 6f9:	66 90                	xchg   %ax,%ax
 6fb:	66 90                	xchg   %ax,%ax
 6fd:	66 90                	xchg   %ax,%ax
 6ff:	90                   	nop

00000700 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 3c             	sub    $0x3c,%esp
 709:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 70c:	89 d1                	mov    %edx,%ecx
{
 70e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 711:	85 d2                	test   %edx,%edx
 713:	0f 89 7f 00 00 00    	jns    798 <printint+0x98>
 719:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 71d:	74 79                	je     798 <printint+0x98>
    neg = 1;
 71f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 726:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 728:	31 db                	xor    %ebx,%ebx
 72a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 72d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 730:	89 c8                	mov    %ecx,%eax
 732:	31 d2                	xor    %edx,%edx
 734:	89 cf                	mov    %ecx,%edi
 736:	f7 75 c4             	divl   -0x3c(%ebp)
 739:	0f b6 92 3c 0b 00 00 	movzbl 0xb3c(%edx),%edx
 740:	89 45 c0             	mov    %eax,-0x40(%ebp)
 743:	89 d8                	mov    %ebx,%eax
 745:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 748:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 74b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 74e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 751:	76 dd                	jbe    730 <printint+0x30>
  if(neg)
 753:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 756:	85 c9                	test   %ecx,%ecx
 758:	74 0c                	je     766 <printint+0x66>
    buf[i++] = '-';
 75a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 75f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 761:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 766:	8b 7d b8             	mov    -0x48(%ebp),%edi
 769:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 76d:	eb 07                	jmp    776 <printint+0x76>
 76f:	90                   	nop
 770:	0f b6 13             	movzbl (%ebx),%edx
 773:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 776:	83 ec 04             	sub    $0x4,%esp
 779:	88 55 d7             	mov    %dl,-0x29(%ebp)
 77c:	6a 01                	push   $0x1
 77e:	56                   	push   %esi
 77f:	57                   	push   %edi
 780:	e8 ee fe ff ff       	call   673 <write>
  while(--i >= 0)
 785:	83 c4 10             	add    $0x10,%esp
 788:	39 de                	cmp    %ebx,%esi
 78a:	75 e4                	jne    770 <printint+0x70>
    putc(fd, buf[i]);
}
 78c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 78f:	5b                   	pop    %ebx
 790:	5e                   	pop    %esi
 791:	5f                   	pop    %edi
 792:	5d                   	pop    %ebp
 793:	c3                   	ret
 794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 798:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 79f:	eb 87                	jmp    728 <printint+0x28>
 7a1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7a8:	00 
 7a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000007b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7b0:	f3 0f 1e fb          	endbr32
 7b4:	55                   	push   %ebp
 7b5:	89 e5                	mov    %esp,%ebp
 7b7:	57                   	push   %edi
 7b8:	56                   	push   %esi
 7b9:	53                   	push   %ebx
 7ba:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7bd:	8b 75 0c             	mov    0xc(%ebp),%esi
 7c0:	0f b6 1e             	movzbl (%esi),%ebx
 7c3:	84 db                	test   %bl,%bl
 7c5:	0f 84 b4 00 00 00    	je     87f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 7cb:	8d 45 10             	lea    0x10(%ebp),%eax
 7ce:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 7d1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 7d4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 7d6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7d9:	eb 33                	jmp    80e <printf+0x5e>
 7db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 7e0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7e3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 7e8:	83 f8 25             	cmp    $0x25,%eax
 7eb:	74 17                	je     804 <printf+0x54>
  write(fd, &c, 1);
 7ed:	83 ec 04             	sub    $0x4,%esp
 7f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 7f3:	6a 01                	push   $0x1
 7f5:	57                   	push   %edi
 7f6:	ff 75 08             	push   0x8(%ebp)
 7f9:	e8 75 fe ff ff       	call   673 <write>
 7fe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 801:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 804:	0f b6 1e             	movzbl (%esi),%ebx
 807:	83 c6 01             	add    $0x1,%esi
 80a:	84 db                	test   %bl,%bl
 80c:	74 71                	je     87f <printf+0xcf>
    c = fmt[i] & 0xff;
 80e:	0f be cb             	movsbl %bl,%ecx
 811:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 814:	85 d2                	test   %edx,%edx
 816:	74 c8                	je     7e0 <printf+0x30>
      }
    } else if(state == '%'){
 818:	83 fa 25             	cmp    $0x25,%edx
 81b:	75 e7                	jne    804 <printf+0x54>
      if(c == 'd'){
 81d:	83 f8 64             	cmp    $0x64,%eax
 820:	0f 84 9a 00 00 00    	je     8c0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 826:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 82c:	83 f9 70             	cmp    $0x70,%ecx
 82f:	74 5f                	je     890 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 831:	83 f8 73             	cmp    $0x73,%eax
 834:	0f 84 d6 00 00 00    	je     910 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 83a:	83 f8 63             	cmp    $0x63,%eax
 83d:	0f 84 8d 00 00 00    	je     8d0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 843:	83 f8 25             	cmp    $0x25,%eax
 846:	0f 84 b4 00 00 00    	je     900 <printf+0x150>
  write(fd, &c, 1);
 84c:	83 ec 04             	sub    $0x4,%esp
 84f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 853:	6a 01                	push   $0x1
 855:	57                   	push   %edi
 856:	ff 75 08             	push   0x8(%ebp)
 859:	e8 15 fe ff ff       	call   673 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 85e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 861:	83 c4 0c             	add    $0xc,%esp
 864:	6a 01                	push   $0x1
 866:	83 c6 01             	add    $0x1,%esi
 869:	57                   	push   %edi
 86a:	ff 75 08             	push   0x8(%ebp)
 86d:	e8 01 fe ff ff       	call   673 <write>
  for(i = 0; fmt[i]; i++){
 872:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 876:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 879:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 87b:	84 db                	test   %bl,%bl
 87d:	75 8f                	jne    80e <printf+0x5e>
    }
  }
}
 87f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 882:	5b                   	pop    %ebx
 883:	5e                   	pop    %esi
 884:	5f                   	pop    %edi
 885:	5d                   	pop    %ebp
 886:	c3                   	ret
 887:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 88e:	00 
 88f:	90                   	nop
        printint(fd, *ap, 16, 0);
 890:	83 ec 0c             	sub    $0xc,%esp
 893:	b9 10 00 00 00       	mov    $0x10,%ecx
 898:	6a 00                	push   $0x0
 89a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 89d:	8b 45 08             	mov    0x8(%ebp),%eax
 8a0:	8b 13                	mov    (%ebx),%edx
 8a2:	e8 59 fe ff ff       	call   700 <printint>
        ap++;
 8a7:	89 d8                	mov    %ebx,%eax
 8a9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8ac:	31 d2                	xor    %edx,%edx
        ap++;
 8ae:	83 c0 04             	add    $0x4,%eax
 8b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8b4:	e9 4b ff ff ff       	jmp    804 <printf+0x54>
 8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 8c0:	83 ec 0c             	sub    $0xc,%esp
 8c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8c8:	6a 01                	push   $0x1
 8ca:	eb ce                	jmp    89a <printf+0xea>
 8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 8d0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 8d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 8d6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 8d8:	6a 01                	push   $0x1
        ap++;
 8da:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 8dd:	57                   	push   %edi
 8de:	ff 75 08             	push   0x8(%ebp)
        putc(fd, *ap);
 8e1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8e4:	e8 8a fd ff ff       	call   673 <write>
        ap++;
 8e9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 8ec:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8ef:	31 d2                	xor    %edx,%edx
 8f1:	e9 0e ff ff ff       	jmp    804 <printf+0x54>
 8f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 8fd:	00 
 8fe:	66 90                	xchg   %ax,%ax
        putc(fd, c);
 900:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 903:	83 ec 04             	sub    $0x4,%esp
 906:	e9 59 ff ff ff       	jmp    864 <printf+0xb4>
 90b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 910:	8b 45 d0             	mov    -0x30(%ebp),%eax
 913:	8b 18                	mov    (%eax),%ebx
        ap++;
 915:	83 c0 04             	add    $0x4,%eax
 918:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 91b:	85 db                	test   %ebx,%ebx
 91d:	74 17                	je     936 <printf+0x186>
        while(*s != 0){
 91f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 922:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 924:	84 c0                	test   %al,%al
 926:	0f 84 d8 fe ff ff    	je     804 <printf+0x54>
 92c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 92f:	89 de                	mov    %ebx,%esi
 931:	8b 5d 08             	mov    0x8(%ebp),%ebx
 934:	eb 1a                	jmp    950 <printf+0x1a0>
          s = "(null)";
 936:	bb 35 0b 00 00       	mov    $0xb35,%ebx
        while(*s != 0){
 93b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 93e:	b8 28 00 00 00       	mov    $0x28,%eax
 943:	89 de                	mov    %ebx,%esi
 945:	8b 5d 08             	mov    0x8(%ebp),%ebx
 948:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 94f:	00 
  write(fd, &c, 1);
 950:	83 ec 04             	sub    $0x4,%esp
          s++;
 953:	83 c6 01             	add    $0x1,%esi
 956:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 959:	6a 01                	push   $0x1
 95b:	57                   	push   %edi
 95c:	53                   	push   %ebx
 95d:	e8 11 fd ff ff       	call   673 <write>
        while(*s != 0){
 962:	0f b6 06             	movzbl (%esi),%eax
 965:	83 c4 10             	add    $0x10,%esp
 968:	84 c0                	test   %al,%al
 96a:	75 e4                	jne    950 <printf+0x1a0>
 96c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 96f:	31 d2                	xor    %edx,%edx
 971:	e9 8e fe ff ff       	jmp    804 <printf+0x54>
 976:	66 90                	xchg   %ax,%ax
 978:	66 90                	xchg   %ax,%ax
 97a:	66 90                	xchg   %ax,%ax
 97c:	66 90                	xchg   %ax,%ax
 97e:	66 90                	xchg   %ax,%ax

00000980 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 980:	f3 0f 1e fb          	endbr32
 984:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 985:	a1 e4 0e 00 00       	mov    0xee4,%eax
{
 98a:	89 e5                	mov    %esp,%ebp
 98c:	57                   	push   %edi
 98d:	56                   	push   %esi
 98e:	53                   	push   %ebx
 98f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 992:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 994:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 997:	39 c8                	cmp    %ecx,%eax
 999:	73 15                	jae    9b0 <free+0x30>
 99b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 9a0:	39 d1                	cmp    %edx,%ecx
 9a2:	72 14                	jb     9b8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a4:	39 d0                	cmp    %edx,%eax
 9a6:	73 10                	jae    9b8 <free+0x38>
{
 9a8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9aa:	8b 10                	mov    (%eax),%edx
 9ac:	39 c8                	cmp    %ecx,%eax
 9ae:	72 f0                	jb     9a0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9b0:	39 d0                	cmp    %edx,%eax
 9b2:	72 f4                	jb     9a8 <free+0x28>
 9b4:	39 d1                	cmp    %edx,%ecx
 9b6:	73 f0                	jae    9a8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9be:	39 fa                	cmp    %edi,%edx
 9c0:	74 1e                	je     9e0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9c2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9c5:	8b 50 04             	mov    0x4(%eax),%edx
 9c8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9cb:	39 f1                	cmp    %esi,%ecx
 9cd:	74 28                	je     9f7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9cf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 9d1:	5b                   	pop    %ebx
  freep = p;
 9d2:	a3 e4 0e 00 00       	mov    %eax,0xee4
}
 9d7:	5e                   	pop    %esi
 9d8:	5f                   	pop    %edi
 9d9:	5d                   	pop    %ebp
 9da:	c3                   	ret
 9db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 9e0:	03 72 04             	add    0x4(%edx),%esi
 9e3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9e6:	8b 10                	mov    (%eax),%edx
 9e8:	8b 12                	mov    (%edx),%edx
 9ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9ed:	8b 50 04             	mov    0x4(%eax),%edx
 9f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9f3:	39 f1                	cmp    %esi,%ecx
 9f5:	75 d8                	jne    9cf <free+0x4f>
    p->s.size += bp->s.size;
 9f7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 9fa:	a3 e4 0e 00 00       	mov    %eax,0xee4
    p->s.size += bp->s.size;
 9ff:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a02:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a05:	89 10                	mov    %edx,(%eax)
}
 a07:	5b                   	pop    %ebx
 a08:	5e                   	pop    %esi
 a09:	5f                   	pop    %edi
 a0a:	5d                   	pop    %ebp
 a0b:	c3                   	ret
 a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a10 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a10:	f3 0f 1e fb          	endbr32
 a14:	55                   	push   %ebp
 a15:	89 e5                	mov    %esp,%ebp
 a17:	57                   	push   %edi
 a18:	56                   	push   %esi
 a19:	53                   	push   %ebx
 a1a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a1d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a20:	8b 3d e4 0e 00 00    	mov    0xee4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a26:	8d 70 07             	lea    0x7(%eax),%esi
 a29:	c1 ee 03             	shr    $0x3,%esi
 a2c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a2f:	85 ff                	test   %edi,%edi
 a31:	0f 84 a9 00 00 00    	je     ae0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a37:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 a39:	8b 48 04             	mov    0x4(%eax),%ecx
 a3c:	39 f1                	cmp    %esi,%ecx
 a3e:	73 6d                	jae    aad <malloc+0x9d>
 a40:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 a46:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a4b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a4e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 a55:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 a58:	eb 17                	jmp    a71 <malloc+0x61>
 a5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a60:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 a62:	8b 4a 04             	mov    0x4(%edx),%ecx
 a65:	39 f1                	cmp    %esi,%ecx
 a67:	73 4f                	jae    ab8 <malloc+0xa8>
 a69:	8b 3d e4 0e 00 00    	mov    0xee4,%edi
 a6f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a71:	39 c7                	cmp    %eax,%edi
 a73:	75 eb                	jne    a60 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 a75:	83 ec 0c             	sub    $0xc,%esp
 a78:	ff 75 e4             	push   -0x1c(%ebp)
 a7b:	e8 5b fc ff ff       	call   6db <sbrk>
  if(p == (char*)-1)
 a80:	83 c4 10             	add    $0x10,%esp
 a83:	83 f8 ff             	cmp    $0xffffffff,%eax
 a86:	74 1b                	je     aa3 <malloc+0x93>
  hp->s.size = nu;
 a88:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a8b:	83 ec 0c             	sub    $0xc,%esp
 a8e:	83 c0 08             	add    $0x8,%eax
 a91:	50                   	push   %eax
 a92:	e8 e9 fe ff ff       	call   980 <free>
  return freep;
 a97:	a1 e4 0e 00 00       	mov    0xee4,%eax
      if((p = morecore(nunits)) == 0)
 a9c:	83 c4 10             	add    $0x10,%esp
 a9f:	85 c0                	test   %eax,%eax
 aa1:	75 bd                	jne    a60 <malloc+0x50>
        return 0;
  }
}
 aa3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 aa6:	31 c0                	xor    %eax,%eax
}
 aa8:	5b                   	pop    %ebx
 aa9:	5e                   	pop    %esi
 aaa:	5f                   	pop    %edi
 aab:	5d                   	pop    %ebp
 aac:	c3                   	ret
    if(p->s.size >= nunits){
 aad:	89 c2                	mov    %eax,%edx
 aaf:	89 f8                	mov    %edi,%eax
 ab1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 ab8:	39 ce                	cmp    %ecx,%esi
 aba:	74 54                	je     b10 <malloc+0x100>
        p->s.size -= nunits;
 abc:	29 f1                	sub    %esi,%ecx
 abe:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 ac1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 ac4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 ac7:	a3 e4 0e 00 00       	mov    %eax,0xee4
}
 acc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 acf:	8d 42 08             	lea    0x8(%edx),%eax
}
 ad2:	5b                   	pop    %ebx
 ad3:	5e                   	pop    %esi
 ad4:	5f                   	pop    %edi
 ad5:	5d                   	pop    %ebp
 ad6:	c3                   	ret
 ad7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 ade:	00 
 adf:	90                   	nop
    base.s.ptr = freep = prevp = &base;
 ae0:	c7 05 e4 0e 00 00 e8 	movl   $0xee8,0xee4
 ae7:	0e 00 00 
    base.s.size = 0;
 aea:	bf e8 0e 00 00       	mov    $0xee8,%edi
    base.s.ptr = freep = prevp = &base;
 aef:	c7 05 e8 0e 00 00 e8 	movl   $0xee8,0xee8
 af6:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 af9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 afb:	c7 05 ec 0e 00 00 00 	movl   $0x0,0xeec
 b02:	00 00 00 
    if(p->s.size >= nunits){
 b05:	e9 36 ff ff ff       	jmp    a40 <malloc+0x30>
 b0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b10:	8b 0a                	mov    (%edx),%ecx
 b12:	89 08                	mov    %ecx,(%eax)
 b14:	eb b1                	jmp    ac7 <malloc+0xb7>
