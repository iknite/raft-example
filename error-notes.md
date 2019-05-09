# usage

Start commands
```
rm -rf example-data  # terminal1
go run . -nodeid 1  # terminal1
go run . -nodeid 2  # terminal2
go run . -nodeid 3  # terminal3
ab -n 100000000 -c 10 http://127.0.0.1:3001/  # terminal 4
```

Steps for the exception:
- wait 10 seconds
- close node 2
- wait 10 seconds 
- restart node 2
- try restart again node 2




## first exception

```
2019-05-09 15:46:15.515734 I | dragonboat: check initial snapshot, [00128:00002]
2019-05-09 15:46:15.515841 I | dragonboat: [00128:00002] called recoverFromSnapshot
2019-05-09 15:46:15.515867 I | dragonboat: all disk SM [00128:00002] beng initialized
dbdir example-data/128_2/5577006791947779410_1557407922870613671, fi.name 5577006791947779410_1557407922870613671, dir example-data/128_2
2019-05-09 15:46:15.649756 I | dragonboat: [00128:00002] is restoring remotes {ConfigChangeId:3 Addresses:map[1:localhost:63001 2:localhost:63002 3:localhost:63003] Removed:map[] Observers:map[]}
2019-05-09 15:46:15.650442 I | dragonboat: [00128:00002] called captureClusterConfig, nodes map[1:localhost:63001 2:localhost:63002 3:localhost:63003], observers map[]
2019-05-09 15:46:15.650606 I | dragonboat: [00128:00002] has 3 snapshots to shrink
2019-05-09 15:46:15.650808 I | dragonboat: [00128:00002] received completed snapshot rec (1) {ClusterID:0 NodeID:0 Index:3767 SnapshotAvailable:true InitialSnapshot:true SnapshotRequested:false StreamSnapshot:false SnapshotRequest:{Type:0 Key:0 Path:} Entries:[]}
2019-05-09 15:46:15.650843 I | dragonboat: [00128:00002] handled initial snapshot, index 3767
2019-05-09 15:46:15.650862 I | dragonboat: [00128:00002] initial index set to 3767
2019-05-09 15:46:15.660335 I | dragonboat: [00128:00002] will shrink snapshots up to 3767
2019-05-09 15:46:15.660558 I | dragonboat: [00128:00002] has 3 snapshots to shrink
2019-05-09 15:46:15.662884 I | dragonboat: snapshot at index 3787 requested on [00128:00002]
2019-05-09 15:46:15.662949 I | dragonboat: reportRequestedSnapshot, [00128:00002]
2019-05-09 15:46:15.662982 I | dragonboat: [00128:00002] called saveSnapshot
2019-05-09 15:46:15.675232 I | dragonboat: [00128:00002] snapshotted, index 3787, term 7, file count 0
2019-05-09 15:46:15.756541 I | dragonboat: [00128:00002] received completed snapshot rec (2) {ClusterID:0 NodeID:0 Index:0 SnapshotAvailable:false InitialSnapshot:false SnapshotRequested:true StreamSnapshot:false SnapshotRequest:{Type:0 Key:0 Path:} Entries:[]}
2019-05-09 15:46:15.775034 I | dragonboat: [00128:00002] has 1 snapshots to compact
2019-05-09 15:46:15.775069 I | dragonboat: [00128:00002] compacting snapshot 3713, 0
2019-05-09 15:46:15.793060 I | dragonboat: [00128:00002] compacted log at index 3782
2019-05-09 15:46:26.323824 I | dragonboat: [00128:00002] is sending MsgSnapshotReceived to 1
2019-05-09 15:46:26.357707 I | dragonboat: [00128:00002], snapshot 11738 is ready to be published
2019-05-09 15:46:26.357750 I | dragonboat: check incoming snapshot, [00128:00002]
2019-05-09 15:46:26.357768 I | dragonboat: [00128:00002] called recoverFromSnapshot
2019-05-09 15:46:26.502275 I | dragonboat: [00128:00002] is sending MsgSnapshotReceived to 1
2019-05-09 15:46:26.504806 I | dragonboat: [00128:00002], snapshot 11829 is ready to be published
2019-05-09 15:46:26.775313 I | dragonboat: [00128:00002] is restoring remotes {ConfigChangeId:3 Addresses:map[1:localhost:63001 2:localhost:63002 3:localhost:63003] Removed:map[] Observers:map[]}
2019-05-09 15:46:26.775393 I | dragonboat: [00128:00002] called captureClusterConfig, nodes map[1:localhost:63001 2:localhost:63002 3:localhost:63003], observers map[]
2019-05-09 15:46:26.775550 I | dragonboat: [00128:00002] has 5 snapshots to shrink
2019-05-09 15:46:26.775585 I | dragonboat: [00128:00002] shrinking snapshot 11738, 3
2019-05-09 15:46:26.796707 I | dragonboat: [00128:00002] received completed snapshot rec (1) {ClusterID:0 NodeID:0 Index:0 SnapshotAvailable:true InitialSnapshot:false SnapshotRequested:false StreamSnapshot:false SnapshotRequest:{Type:0 Key:0 Path:} Entries:[]}
2019-05-09 15:46:26.796765 I | dragonboat: check incoming snapshot, [00128:00002]
2019-05-09 15:46:26.796795 I | dragonboat: [00128:00002] called recoverFromSnapshot
2019-05-09 15:46:27.261720 E | utils: worker is panicing, last applied not moving forward
panic: last applied not moving forward [recovered]
	panic: last applied not moving forward

goroutine 128 [running]:
github.com/lni/dragonboat/internal/utils/syncutil.(*Stopper).runWorker.func1.1()
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/internal/utils/syncutil/stopper.go:84 +0xeb
panic(0x8bf600, 0xa0fcc0)
	/usr/lib/go/src/runtime/panic.go:522 +0x1b5
github.com/iknite/raft-example/wal.(*DiskKV).RecoverFromSnapshot(0xc000142900, 0xa1a920, 0xc00070a400, 0xc0000261e0, 0x4, 0x8)
	/home/iknite/work/bbva/gopath/src/github.com/iknite/raft-example/wal/diskkv.go:502 +0x68b
github.com/lni/dragonboat/internal/rsm.(*OnDiskStateMachine).RecoverFromSnapshot(0xc000142930, 0x2e35, 0xa1a920, 0xc00070a400, 0xdfa020, 0x0, 0x0, 0xc0000261e0, 0x0, 0x0)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/internal/rsm/sm.go:278 +0x71
github.com/lni/dragonboat/internal/rsm.(*NativeStateMachine).RecoverFromSnapshot(0xc00018e820, 0x2e35, 0xc00070a400, 0xdfa020, 0x0, 0x0, 0x0, 0x0)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/internal/rsm/managedstatemachine.go:388 +0x84
github.com/lni/dragonboat.(*snapshotter).Load(0xc000650200, 0x2e35, 0xa1a900, 0xc000010050, 0x7f265400c650, 0xc00018e820, 0xc000fff4a0, 0x9e, 0xdfa020, 0x0, ...)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/snapshotter.go:151 +0x211
github.com/lni/dragonboat/internal/rsm.(*StateMachine).recoverSnapshot(0xc0000ac280, 0xc000fff0e0, 0x9e, 0x0, 0x2e35, 0x7, 0x3, 0xc0004517a0, 0x0, 0x0, ...)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/internal/rsm/statemachine.go:266 +0x50f
github.com/lni/dragonboat/internal/rsm.(*StateMachine).RecoverFromSnapshot(0xc0000ac280, 0x0, 0x0, 0x2e35, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/internal/rsm/statemachine.go:192 +0x288
github.com/lni/dragonboat.(*node).recoverFromSnapshot(0xc00000c1e0, 0x0, 0x0, 0x2e35, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/node.go:608 +0xf8
github.com/lni/dragonboat.(*execEngine).recoverFromSnapshot(0xc000400000, 0x80, 0xc0001434a0)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/execengine.go:326 +0x304
github.com/lni/dragonboat.(*execEngine).snapshotWorkerMain(0xc000400000, 0x1)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/execengine.go:249 +0x123
github.com/lni/dragonboat.newExecEngine.func3()
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/execengine.go:178 +0x33
github.com/lni/dragonboat/internal/utils/syncutil.(*Stopper).runWorker.func1(0xc0001928c0, 0xc00044c078, 0x0, 0x0, 0xc0001461e0)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/internal/utils/syncutil/stopper.go:91 +0x5d
created by github.com/lni/dragonboat/internal/utils/syncutil.(*Stopper).runWorker
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/internal/utils/syncutil/stopper.go:80 +0x98
exit status 2
````


## second exception and subsecuents

```
2019-05-09 15:46:53.187871 I | dragonboat: check initial snapshot, [00128:00002]
2019-05-09 15:46:53.188010 I | dragonboat: [00128:00002] called recoverFromSnapshot
2019-05-09 15:46:53.188039 I | dragonboat: all disk SM [00128:00002] beng initialized
dbdir example-data/128_2/13260572831089785859_1557409586802148442, fi.name 13260572831089785859_1557409586802148442, dir example-data/128_2
dbdir example-data/128_2/13260572831089785859_1557409586802148442, fi.name 15352856648520921629_1557409586359889761, dir example-data/128_2
removing example-data/128_2/15352856648520921629_1557409586359889761
2019-05-09 15:46:53.424664 C | rsm: recover snapshot moving applied index backwards, 11829, 11829
2019-05-09 15:46:53.424732 E | utils: worker is panicing, recover snapshot moving applied index backwards, 11829, 11829
panic: recover snapshot moving applied index backwards, 11829, 11829 [recovered]
	panic: recover snapshot moving applied index backwards, 11829, 11829

goroutine 112 [running]:
github.com/lni/dragonboat/internal/utils/syncutil.(*Stopper).runWorker.func1.1()
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/internal/utils/syncutil/stopper.go:84 +0xeb
panic(0x8bf600, 0xc000bce260)
	/usr/lib/go/src/runtime/panic.go:522 +0x1b5
github.com/lni/dragonboat/internal/utils/logutil/capnslog.(*PackageLogger).Panicf(0xc0000ae660, 0x98e6d8, 0x37, 0xc0003ee420, 0x2, 0x2)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/internal/utils/logutil/capnslog/pkg_logger.go:83 +0x135
github.com/lni/dragonboat/logger.(*capnsLog).Panicf(0xc0000ba070, 0x98e6d8, 0x37, 0xc0003ee420, 0x2, 0x2)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/logger/capnslogger.go:73 +0x60
github.com/lni/dragonboat/logger.(*dragonboatLogger).Panicf(0xc0000a75c0, 0x98e6d8, 0x37, 0xc0003ee420, 0x2, 0x2)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/logger/logger.go:120 +0x74
github.com/lni/dragonboat/internal/rsm.(*OnDiskStateMachine).RecoverFromSnapshot(0xc000722390, 0x2e35, 0xa1a920, 0xc0006d6100, 0xdfa020, 0x0, 0x0, 0xc0003fc0c0, 0x0, 0x0)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/internal/rsm/sm.go:274 +0x14b
github.com/lni/dragonboat/internal/rsm.(*NativeStateMachine).RecoverFromSnapshot(0xc000150640, 0x2e35, 0xc0006d6100, 0xdfa020, 0x0, 0x0, 0x0, 0x0)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/internal/rsm/managedstatemachine.go:388 +0x84
github.com/lni/dragonboat.(*snapshotter).Load(0xc00045d040, 0x2e35, 0xa1a900, 0xc00045a060, 0x7f2ae86ef720, 0xc000150640, 0xc000bd6640, 0x9e, 0xdfa020, 0x0, ...)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/snapshotter.go:151 +0x211
github.com/lni/dragonboat/internal/rsm.(*StateMachine).recoverSnapshot(0xc0004160a0, 0xc000bd6280, 0x9e, 0x0, 0x2e35, 0x7, 0x3, 0xc0007683c0, 0x0, 0x0, ...)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/internal/rsm/statemachine.go:266 +0x50f
github.com/lni/dragonboat/internal/rsm.(*StateMachine).RecoverFromSnapshot(0xc0004160a0, 0x0, 0x0, 0x0, 0x101, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/internal/rsm/statemachine.go:192 +0x288
github.com/lni/dragonboat.(*node).recoverFromSnapshot(0xc00000c1e0, 0x0, 0x0, 0x0, 0x101, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/node.go:608 +0xf8
github.com/lni/dragonboat.(*execEngine).recoverFromSnapshot(0xc000416000, 0x80, 0xc0001746f0)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/execengine.go:326 +0x304
github.com/lni/dragonboat.(*execEngine).snapshotWorkerMain(0xc000416000, 0x1)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/execengine.go:249 +0x123
github.com/lni/dragonboat.newExecEngine.func3()
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/execengine.go:178 +0x33
github.com/lni/dragonboat/internal/utils/syncutil.(*Stopper).runWorker.func1(0xc0003d0fe0, 0xc0003cc0e8, 0x0, 0x0, 0xc0003d02e0)
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/internal/utils/syncutil/stopper.go:91 +0x5d
created by github.com/lni/dragonboat/internal/utils/syncutil.(*Stopper).runWorker
	/home/iknite/work/bbva/gopath/pkg/mod/github.com/lni/dragonboat@v2.1.1-0.20190509074619-54b5e2a4f3d1+incompatible/internal/utils/syncutil/stopper.go:80 +0x98
exit status 2
```

