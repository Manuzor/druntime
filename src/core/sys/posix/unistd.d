/**
 * D header file for POSIX.
 *
 * Copyright: Copyright Sean Kelly 2005 - 2009.
 * License:   <a href="http://www.boost.org/LICENSE_1_0.txt">Boost License 1.0</a>.
 * Authors:   Sean Kelly
 * Standards: The Open Group Base Specifications Issue 6, IEEE Std 1003.1, 2004 Edition
 */

/*          Copyright Sean Kelly 2005 - 2009.
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module core.sys.posix.unistd;

private import core.sys.posix.config;
private import core.stdc.stddef;
public import core.sys.posix.inttypes;  // for intptr_t
public import core.sys.posix.sys.types; // for size_t, ssize_t, uid_t, gid_t, off_t, pid_t, useconds_t

version (Posix):
extern (C):

version( Posix )
{
    enum STDIN_FILENO  = 0;
    enum STDOUT_FILENO = 1;
    enum STDERR_FILENO = 2;

    __gshared char*   optarg;
    __gshared int     optind;
    __gshared int     opterr;
    __gshared int     optopt;

    int     access(in char*, int);
    uint    alarm(uint);
    int     chdir(in char*);
    int     chown(in char*, uid_t, gid_t);
    int     close(int);
    size_t  confstr(int, char*, size_t);
    int     dup(int);
    int     dup2(int, int);
    int     execl(in char*, in char*, ...);
    int     execle(in char*, in char*, ...);
    int     execlp(in char*, in char*, ...);
    int     execv(in char*, in char**);
    int     execve(in char*, in char**, in char**);
    int     execvp(in char*, in char**);
    void    _exit(int);
    int     fchown(int, uid_t, gid_t);
    pid_t   fork();
    c_long  fpathconf(int, int);
    //int     ftruncate(int, off_t);
    char*   getcwd(char*, size_t);
    gid_t   getegid();
    uid_t   geteuid();
    gid_t   getgid();
    int     getgroups(int, gid_t *);
    int     gethostname(char*, size_t);
    char*   getlogin();
    int     getlogin_r(char*, size_t);
    int     getopt(int, in char**, in char*);
    pid_t   getpgrp();
    pid_t   getpid();
    pid_t   getppid();
    uid_t   getuid();
    int     isatty(int);
    int     link(in char*, in char*);
    //off_t   lseek(int, off_t, int);
    c_long  pathconf(in char*, int);
    int     pause();
    int     pipe(ref int[2]);
    ssize_t read(int, void*, size_t);
    ssize_t readlink(in char*, char*, size_t);
    int     rmdir(in char*);
    int     setegid(gid_t);
    int     seteuid(uid_t);
    int     setgid(gid_t);
    int     setpgid(pid_t, pid_t);
    pid_t   setsid();
    int     setuid(uid_t);
    uint    sleep(uint);
    int     symlink(in char*, in char*);
    c_long  sysconf(int);
    pid_t   tcgetpgrp(int);
    int     tcsetpgrp(int, pid_t);
    char*   ttyname(int);
    int     ttyname_r(int, char*, size_t);
    int     unlink(in char*);
    ssize_t write(int, in void*, size_t);
}

version( linux )
{
  static if( __USE_FILE_OFFSET64 )
  {
    off_t lseek64(int, off_t, int);
    alias lseek64 lseek;
  }
  else
  {
    off_t lseek(int, off_t, int);
  }
  static if( __USE_LARGEFILE64 )
  {
    int   ftruncate64(int, off_t);
    alias ftruncate64 ftruncate;
  }
  else
  {
    int   ftruncate(int, off_t);
  }
}
else version( FreeBSD )
{
    off_t lseek(int, off_t, int);
    int   ftruncate(int, off_t);
}
else version( Posix )
{
    off_t lseek(int, off_t, int);
    int   ftruncate(int, off_t);
}

version( linux )
{
    enum F_OK       = 0;
    enum R_OK       = 4;
    enum W_OK       = 2;
    enum X_OK       = 1;

    enum F_ULOCK    = 0;
    enum F_LOCK     = 1;
    enum F_TLOCK    = 2;
    enum F_TEST     = 3;

    enum
    {
        _CS_PATH,

        _CS_V6_WIDTH_RESTRICTED_ENVS,

        _CS_GNU_LIBC_VERSION,
        _CS_GNU_LIBPTHREAD_VERSION,

        _CS_LFS_CFLAGS = 1000,
        _CS_LFS_LDFLAGS,
        _CS_LFS_LIBS,
        _CS_LFS_LINTFLAGS,
        _CS_LFS64_CFLAGS,
        _CS_LFS64_LDFLAGS,
        _CS_LFS64_LIBS,
        _CS_LFS64_LINTFLAGS,

        _CS_XBS5_ILP32_OFF32_CFLAGS = 1100,
        _CS_XBS5_ILP32_OFF32_LDFLAGS,
        _CS_XBS5_ILP32_OFF32_LIBS,
        _CS_XBS5_ILP32_OFF32_LINTFLAGS,
        _CS_XBS5_ILP32_OFFBIG_CFLAGS,
        _CS_XBS5_ILP32_OFFBIG_LDFLAGS,
        _CS_XBS5_ILP32_OFFBIG_LIBS,
        _CS_XBS5_ILP32_OFFBIG_LINTFLAGS,
        _CS_XBS5_LP64_OFF64_CFLAGS,
        _CS_XBS5_LP64_OFF64_LDFLAGS,
        _CS_XBS5_LP64_OFF64_LIBS,
        _CS_XBS5_LP64_OFF64_LINTFLAGS,
        _CS_XBS5_LPBIG_OFFBIG_CFLAGS,
        _CS_XBS5_LPBIG_OFFBIG_LDFLAGS,
        _CS_XBS5_LPBIG_OFFBIG_LIBS,
        _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS,

        _CS_POSIX_V6_ILP32_OFF32_CFLAGS,
        _CS_POSIX_V6_ILP32_OFF32_LDFLAGS,
        _CS_POSIX_V6_ILP32_OFF32_LIBS,
        _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS,
        _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS,
        _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS,
        _CS_POSIX_V6_ILP32_OFFBIG_LIBS,
        _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS,
        _CS_POSIX_V6_LP64_OFF64_CFLAGS,
        _CS_POSIX_V6_LP64_OFF64_LDFLAGS,
        _CS_POSIX_V6_LP64_OFF64_LIBS,
        _CS_POSIX_V6_LP64_OFF64_LINTFLAGS,
        _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS,
        _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS,
        _CS_POSIX_V6_LPBIG_OFFBIG_LIBS,
        _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS
    }

    enum
    {
        _PC_LINK_MAX,
        _PC_MAX_CANON,
        _PC_MAX_INPUT,
        _PC_NAME_MAX,
        _PC_PATH_MAX,
        _PC_PIPE_BUF,
        _PC_CHOWN_RESTRICTED,
        _PC_NO_TRUNC,
        _PC_VDISABLE,
        _PC_SYNC_IO,
        _PC_ASYNC_IO,
        _PC_PRIO_IO,
        _PC_SOCK_MAXBUF,
        _PC_FILESIZEBITS,
        _PC_REC_INCR_XFER_SIZE,
        _PC_REC_MAX_XFER_SIZE,
        _PC_REC_MIN_XFER_SIZE,
        _PC_REC_XFER_ALIGN,
        _PC_ALLOC_SIZE_MIN,
        _PC_SYMLINK_MAX,
        _PC_2_SYMLINKS
    }

    enum
    {
        _SC_ARG_MAX,
        _SC_CHILD_MAX,
        _SC_CLK_TCK,
        _SC_NGROUPS_MAX,
        _SC_OPEN_MAX,
        _SC_STREAM_MAX,
        _SC_TZNAME_MAX,
        _SC_JOB_CONTROL,
        _SC_SAVED_IDS,
        _SC_REALTIME_SIGNALS,
        _SC_PRIORITY_SCHEDULING,
        _SC_TIMERS,
        _SC_ASYNCHRONOUS_IO,
        _SC_PRIORITIZED_IO,
        _SC_SYNCHRONIZED_IO,
        _SC_FSYNC,
        _SC_MAPPED_FILES,
        _SC_MEMLOCK,
        _SC_MEMLOCK_RANGE,
        _SC_MEMORY_PROTECTION,
        _SC_MESSAGE_PASSING,
        _SC_SEMAPHORES,
        _SC_SHARED_MEMORY_OBJECTS,
        _SC_AIO_LISTIO_MAX,
        _SC_AIO_MAX,
        _SC_AIO_PRIO_DELTA_MAX,
        _SC_DELAYTIMER_MAX,
        _SC_MQ_OPEN_MAX,
        _SC_MQ_PRIO_MAX,
        _SC_VERSION,
        _SC_PAGESIZE,
        _SC_PAGE_SIZE = _SC_PAGESIZE,
        _SC_RTSIG_MAX,
        _SC_SEM_NSEMS_MAX,
        _SC_SEM_VALUE_MAX,
        _SC_SIGQUEUE_MAX,
        _SC_TIMER_MAX,

        _SC_BC_BASE_MAX,
        _SC_BC_DIM_MAX,
        _SC_BC_SCALE_MAX,
        _SC_BC_STRING_MAX,
        _SC_COLL_WEIGHTS_MAX,
        _SC_EQUIV_CLASS_MAX,
        _SC_EXPR_NEST_MAX,
        _SC_LINE_MAX,
        _SC_RE_DUP_MAX,
        _SC_CHARCLASS_NAME_MAX,

        _SC_2_VERSION,
        _SC_2_C_BIND,
        _SC_2_C_DEV,
        _SC_2_FORT_DEV,
        _SC_2_FORT_RUN,
        _SC_2_SW_DEV,
        _SC_2_LOCALEDEF,

        _SC_PII,
        _SC_PII_XTI,
        _SC_PII_SOCKET,
        _SC_PII_INTERNET,
        _SC_PII_OSI,
        _SC_POLL,
        _SC_SELECT,
        _SC_UIO_MAXIOV,
        _SC_IOV_MAX = _SC_UIO_MAXIOV,
        _SC_PII_INTERNET_STREAM,
        _SC_PII_INTERNET_DGRAM,
        _SC_PII_OSI_COTS,
        _SC_PII_OSI_CLTS,
        _SC_PII_OSI_M,
        _SC_T_IOV_MAX,

        _SC_THREADS,
        _SC_THREAD_SAFE_FUNCTIONS,
        _SC_GETGR_R_SIZE_MAX,
        _SC_GETPW_R_SIZE_MAX,
        _SC_LOGIN_NAME_MAX,
        _SC_TTY_NAME_MAX,
        _SC_THREAD_DESTRUCTOR_ITERATIONS,
        _SC_THREAD_KEYS_MAX,
        _SC_THREAD_STACK_MIN,
        _SC_THREAD_THREADS_MAX,
        _SC_THREAD_ATTR_STACKADDR,
        _SC_THREAD_ATTR_STACKSIZE,
        _SC_THREAD_PRIORITY_SCHEDULING,
        _SC_THREAD_PRIO_INHERIT,
        _SC_THREAD_PRIO_PROTECT,
        _SC_THREAD_PROCESS_SHARED,

        _SC_NPROCESSORS_CONF,
        _SC_NPROCESSORS_ONLN,
        _SC_PHYS_PAGES,
        _SC_AVPHYS_PAGES,
        _SC_ATEXIT_MAX,
        _SC_PASS_MAX,

        _SC_XOPEN_VERSION,
        _SC_XOPEN_XCU_VERSION,
        _SC_XOPEN_UNIX,
        _SC_XOPEN_CRYPT,
        _SC_XOPEN_ENH_I18N,
        _SC_XOPEN_SHM,

        _SC_2_CHAR_TERM,
        _SC_2_C_VERSION,
        _SC_2_UPE,

        _SC_XOPEN_XPG2,
        _SC_XOPEN_XPG3,
        _SC_XOPEN_XPG4,

        _SC_CHAR_BIT,
        _SC_CHAR_MAX,
        _SC_CHAR_MIN,
        _SC_INT_MAX,
        _SC_INT_MIN,
        _SC_LONG_BIT,
        _SC_WORD_BIT,
        _SC_MB_LEN_MAX,
        _SC_NZERO,
        _SC_SSIZE_MAX,
        _SC_SCHAR_MAX,
        _SC_SCHAR_MIN,
        _SC_SHRT_MAX,
        _SC_SHRT_MIN,
        _SC_UCHAR_MAX,
        _SC_UINT_MAX,
        _SC_ULONG_MAX,
        _SC_USHRT_MAX,

        _SC_NL_ARGMAX,
        _SC_NL_LANGMAX,
        _SC_NL_MSGMAX,
        _SC_NL_NMAX,
        _SC_NL_SETMAX,
        _SC_NL_TEXTMAX,

        _SC_XBS5_ILP32_OFF32,
        _SC_XBS5_ILP32_OFFBIG,
        _SC_XBS5_LP64_OFF64,
        _SC_XBS5_LPBIG_OFFBIG,

        _SC_XOPEN_LEGACY,
        _SC_XOPEN_REALTIME,
        _SC_XOPEN_REALTIME_THREADS,

        _SC_ADVISORY_INFO,
        _SC_BARRIERS,
        _SC_BASE,
        _SC_C_LANG_SUPPORT,
        _SC_C_LANG_SUPPORT_R,
        _SC_CLOCK_SELECTION,
        _SC_CPUTIME,
        _SC_THREAD_CPUTIME,
        _SC_DEVICE_IO,
        _SC_DEVICE_SPECIFIC,
        _SC_DEVICE_SPECIFIC_R,
        _SC_FD_MGMT,
        _SC_FIFO,
        _SC_PIPE,
        _SC_FILE_ATTRIBUTES,
        _SC_FILE_LOCKING,
        _SC_FILE_SYSTEM,
        _SC_MONOTONIC_CLOCK,
        _SC_MULTI_PROCESS,
        _SC_SINGLE_PROCESS,
        _SC_NETWORKING,
        _SC_READER_WRITER_LOCKS,
        _SC_SPIN_LOCKS,
        _SC_REGEXP,
        _SC_REGEX_VERSION,
        _SC_SHELL,
        _SC_SIGNALS,
        _SC_SPAWN,
        _SC_SPORADIC_SERVER,
        _SC_THREAD_SPORADIC_SERVER,
        _SC_SYSTEM_DATABASE,
        _SC_SYSTEM_DATABASE_R,
        _SC_TIMEOUTS,
        _SC_TYPED_MEMORY_OBJECTS,
        _SC_USER_GROUPS,
        _SC_USER_GROUPS_R,
        _SC_2_PBS,
        _SC_2_PBS_ACCOUNTING,
        _SC_2_PBS_LOCATE,
        _SC_2_PBS_MESSAGE,
        _SC_2_PBS_TRACK,
        _SC_SYMLOOP_MAX,
        _SC_STREAMS,
        _SC_2_PBS_CHECKPOINT,

        _SC_V6_ILP32_OFF32,
        _SC_V6_ILP32_OFFBIG,
        _SC_V6_LP64_OFF64,
        _SC_V6_LPBIG_OFFBIG,

        _SC_HOST_NAME_MAX,
        _SC_TRACE,
        _SC_TRACE_EVENT_FILTER,
        _SC_TRACE_INHERIT,
        _SC_TRACE_LOG,

        _SC_LEVEL1_ICACHE_SIZE,
        _SC_LEVEL1_ICACHE_ASSOC,
        _SC_LEVEL1_ICACHE_LINESIZE,
        _SC_LEVEL1_DCACHE_SIZE,
        _SC_LEVEL1_DCACHE_ASSOC,
        _SC_LEVEL1_DCACHE_LINESIZE,
        _SC_LEVEL2_CACHE_SIZE,
        _SC_LEVEL2_CACHE_ASSOC,
        _SC_LEVEL2_CACHE_LINESIZE,
        _SC_LEVEL3_CACHE_SIZE,
        _SC_LEVEL3_CACHE_ASSOC,
        _SC_LEVEL3_CACHE_LINESIZE,
        _SC_LEVEL4_CACHE_SIZE,
        _SC_LEVEL4_CACHE_ASSOC,
        _SC_LEVEL4_CACHE_LINESIZE,

        _SC_IPV6 = _SC_LEVEL1_ICACHE_SIZE + 50,
        _SC_RAW_SOCKETS
    }
}
else version( OSX )
{
    enum F_OK       = 0;
    enum R_OK       = 4;
    enum W_OK       = 2;
    enum X_OK       = 1;

    enum F_ULOCK    = 0;
    enum F_LOCK     = 1;
    enum F_TLOCK    = 2;
    enum F_TEST     = 3;
}
else version( FreeBSD )
{
    enum F_OK       = 0;
    enum R_OK       = 0x04;
    enum W_OK       = 0x02;
    enum X_OK       = 0x01;

    enum F_ULOCK    = 0;
    enum F_LOCK     = 1;
    enum F_TLOCK    = 2;
    enum F_TEST     = 3;
}

//
// File Synchronization (FSC)
//
/*
int fsync(int);
*/

version( linux )
{
    int fsync(int);
}
else version( OSX )
{
    int fsync(int);
}
else version( FreeBSD )
{
    int fsync(int);
}

//
// Synchronized I/O (SIO)
//
/*
int fdatasync(int);
*/

version( linux )
{
    int fdatasync(int);
}

//
// XOpen (XSI)
//
/*
char*      crypt(in char*, in char*);
char*      ctermid(char*);
void       encrypt(ref char[64], int);
int        fchdir(int);
c_long     gethostid();
pid_t      getpgid(pid_t);
pid_t      getsid(pid_t);
char*      getwd(char*); // LEGACY
int        lchown(in char*, uid_t, gid_t);
int        lockf(int, int, off_t);
int        nice(int);
ssize_t    pread(int, void*, size_t, off_t);
ssize_t    pwrite(int, in void*, size_t, off_t);
pid_t      setpgrp();
int        setregid(gid_t, gid_t);
int        setreuid(uid_t, uid_t);
void       swab(in void*, void*, ssize_t);
void       sync();
int        truncate(in char*, off_t);
useconds_t ualarm(useconds_t, useconds_t);
int        usleep(useconds_t);
pid_t      vfork();
*/

version( linux )
{
    char*      crypt(in char*, in char*);
    char*      ctermid(char*);
    void       encrypt(ref char[64], int);
    int        fchdir(int);
    c_long     gethostid();
    pid_t      getpgid(pid_t);
    pid_t      getsid(pid_t);
    char*      getwd(char*); // LEGACY
    int        lchown(in char*, uid_t, gid_t);
    //int        lockf(int, int, off_t);
    int        nice(int);
    //ssize_t    pread(int, void*, size_t, off_t);
    //ssize_t    pwrite(int, in void*, size_t, off_t);
    pid_t      setpgrp();
    int        setregid(gid_t, gid_t);
    int        setreuid(uid_t, uid_t);
    void       swab(in void*, void*, ssize_t);
    void       sync();
    //int        truncate(in char*, off_t);
    useconds_t ualarm(useconds_t, useconds_t);
    int        usleep(useconds_t);
    pid_t      vfork();

  static if( __USE_FILE_OFFSET64 )
  {
    int        lockf64(int, int, off_t);
    alias      lockf64 lockf;

    ssize_t    pread64(int, void*, size_t, off_t);
    alias      pread64 pread;

    ssize_t    pwrite64(int, in void*, size_t, off_t);
    alias      pwrite64 pwrite;

    int        truncate64(in char*, off_t);
    alias      truncate64 truncate;
  }
  else
  {
    int        lockf(int, int, off_t);
    ssize_t    pread(int, void*, size_t, off_t);
    ssize_t    pwrite(int, in void*, size_t, off_t);
    int        truncate(in char*, off_t);
  }
}
else version( OSX )
{
    char*      crypt(in char*, in char*);
    char*      ctermid(char*);
    void       encrypt(ref char[64], int);
    int        fchdir(int);
    c_long     gethostid();
    pid_t      getpgid(pid_t);
    pid_t      getsid(pid_t);
    char*      getwd(char*); // LEGACY
    int        lchown(in char*, uid_t, gid_t);
    int        lockf(int, int, off_t);
    int        nice(int);
    ssize_t    pread(int, void*, size_t, off_t);
    ssize_t    pwrite(int, in void*, size_t, off_t);
    pid_t      setpgrp();
    int        setregid(gid_t, gid_t);
    int        setreuid(uid_t, uid_t);
    void       swab(in void*, void*, ssize_t);
    void       sync();
    int        truncate(in char*, off_t);
    useconds_t ualarm(useconds_t, useconds_t);
    int        usleep(useconds_t);
    pid_t      vfork();
}
else version( FreeBSD )
{
    char*      crypt(in char*, in char*);
    //char*      ctermid(char*);
    void       encrypt(ref char[64], int);
    int        fchdir(int);
    c_long     gethostid();
    int        getpgid(pid_t);
    int        getsid(pid_t);
    char*      getwd(char*); // LEGACY
    int        lchown(in char*, uid_t, gid_t);
    int        lockf(int, int, off_t);
    int        nice(int);
    ssize_t    pread(int, void*, size_t, off_t);
    ssize_t    pwrite(int, in void*, size_t, off_t);
    int        setpgrp(pid_t, pid_t);
    int        setregid(gid_t, gid_t);
    int        setreuid(uid_t, uid_t);
    void       swab(in void*, void*, ssize_t);
    void       sync();
    int        truncate(in char*, off_t);
    useconds_t ualarm(useconds_t, useconds_t);
    int        usleep(useconds_t);
    pid_t      vfork();
}
