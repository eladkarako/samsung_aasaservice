.class Lcom/samsung/aasaservice/AASAService$1;
.super Lcom/samsung/aasaservice/IAASA$Stub;
.source "AASAService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/samsung/aasaservice/AASAService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/samsung/aasaservice/AASAService;


# direct methods
.method constructor <init>(Lcom/samsung/aasaservice/AASAService;)V
    .locals 0

    .prologue
    .line 50
    iput-object p1, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    invoke-direct {p0}, Lcom/samsung/aasaservice/IAASA$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public AASARuleUpdateResult(Ljava/lang/String;)Z
    .locals 12
    .param p1, "filepath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 360
    const/4 v5, 0x0

    .line 362
    .local v5, "result":Z
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->getConfirmRuleVersion()I

    move-result v9

    sput v9, Lcom/samsung/aasaservice/AASAService;->confirmedVersion:I

    .line 363
    iget-object v9, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    const/4 v10, 0x2

    invoke-static {v9, v10}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 365
    invoke-static {p1}, Lcom/samsung/aasaservice/AASATokenRule;->parseToken(Ljava/lang/String;)Lcom/samsung/aasaservice/AASATokenRule;

    move-result-object v9

    sput-object v9, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    .line 367
    sget-object v9, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    if-eqz v9, :cond_5

    .line 368
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    sget-object v9, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    iget-object v9, v9, Lcom/samsung/aasaservice/AASATokenRule;->packageList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v2, v9, :cond_3

    .line 369
    sget-object v9, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    iget-object v9, v9, Lcom/samsung/aasaservice/AASATokenRule;->packageList:Ljava/util/ArrayList;

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;

    .line 370
    .local v3, "mAASApackage":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    iget-object v6, v3, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->pkName:Ljava/lang/String;

    .line 371
    .local v6, "rule_pkName":Ljava/lang/String;
    iget-object v7, v3, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->certValue:Ljava/lang/String;

    .line 373
    .local v7, "rule_signature":Ljava/lang/String;
    iget-object v9, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    invoke-static {v9, v6}, Lcom/samsung/aasaservice/AASAService;->access$200(Lcom/samsung/aasaservice/AASAService;Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 374
    invoke-static {}, Lcom/samsung/aasaservice/AASABinder;->getInstance()Lcom/samsung/aasaservice/AASABinder;

    move-result-object v9

    invoke-virtual {v9, v6}, Lcom/samsung/aasaservice/AASABinder;->getPackageSignature(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 375
    iget-object v9, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    invoke-virtual {v9}, Lcom/samsung/aasaservice/AASAService;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 376
    .local v4, "pm":Landroid/content/pm/PackageManager;
    const/4 v8, -0x1

    .line 379
    .local v8, "uid":I
    :try_start_0
    sget-object v9, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    iget-object v9, v9, Lcom/samsung/aasaservice/AASATokenRule;->packageList:Ljava/util/ArrayList;

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;

    iget-object v9, v9, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->pkName:Ljava/lang/String;

    const/16 v10, 0x80

    invoke-virtual {v4, v9, v10}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 380
    .local v0, "appinfo":Landroid/content/pm/ApplicationInfo;
    iget v8, v0, Landroid/content/pm/ApplicationInfo;->uid:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 385
    .end local v0    # "appinfo":Landroid/content/pm/ApplicationInfo;
    :goto_1
    iget-object v9, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    invoke-static {v9, v3}, Lcom/samsung/aasaservice/AASAService;->access$300(Lcom/samsung/aasaservice/AASAService;Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 386
    invoke-static {}, Lcom/samsung/aasaservice/AASABinder;->getInstance()Lcom/samsung/aasaservice/AASABinder;

    move-result-object v10

    sget-object v9, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    iget-object v9, v9, Lcom/samsung/aasaservice/AASATokenRule;->packageList:Ljava/util/ArrayList;

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;

    iget-object v11, v9, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->permissionName:Ljava/util/ArrayList;

    sget-object v9, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    iget-object v9, v9, Lcom/samsung/aasaservice/AASATokenRule;->packageList:Ljava/util/ArrayList;

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;

    iget-object v9, v9, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->pkName:Ljava/lang/String;

    invoke-virtual {v10, v8, v11, v9}, Lcom/samsung/aasaservice/AASABinder;->blockPackageByToken(ILjava/util/ArrayList;Ljava/lang/String;)Z

    move-result v5

    .line 368
    .end local v4    # "pm":Landroid/content/pm/PackageManager;
    .end local v8    # "uid":I
    :cond_0
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 381
    .restart local v4    # "pm":Landroid/content/pm/PackageManager;
    .restart local v8    # "uid":I
    :catch_0
    move-exception v1

    .line 382
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 388
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v4    # "pm":Landroid/content/pm/PackageManager;
    .end local v8    # "uid":I
    :cond_1
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->isDebug()Z

    move-result v9

    if-eqz v9, :cond_0

    const-string v9, "AASAservice"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "checkSignature() = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {}, Lcom/samsung/aasaservice/AASABinder;->getInstance()Lcom/samsung/aasaservice/AASABinder;

    move-result-object v11

    invoke-virtual {v11, v6}, Lcom/samsung/aasaservice/AASABinder;->getPackageSignature(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 391
    :cond_2
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->isDebug()Z

    move-result v9

    if-eqz v9, :cond_0

    const-string v9, "AASAservice"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "checkExistPackage() = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    invoke-static {v11, v6}, Lcom/samsung/aasaservice/AASAService;->access$200(Lcom/samsung/aasaservice/AASAService;Ljava/lang/String;)Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 394
    .end local v3    # "mAASApackage":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .end local v6    # "rule_pkName":Ljava/lang/String;
    .end local v7    # "rule_signature":Ljava/lang/String;
    :cond_3
    sget-object v9, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->SPD_SUCCESS:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    sput-object v9, Lcom/samsung/aasaservice/AASAService;->SPD_result:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    .line 395
    const/4 v5, 0x1

    .line 397
    sget-object v9, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    invoke-virtual {v9}, Lcom/samsung/aasaservice/AASATokenRule;->clearAASATokenRule()V

    .line 398
    const/4 v9, 0x0

    sput-object v9, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    .line 402
    .end local v2    # "i":I
    :goto_3
    const-string v9, "AASAservice"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "AASARuleUpdateResult() : Result - "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Lcom/samsung/aasaservice/AASAService;->SPD_result:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    :cond_4
    return v5

    .line 400
    :cond_5
    const/4 v5, 0x0

    goto :goto_3
.end method

.method public IsAASAenabled()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 323
    const/4 v0, 0x1

    .line 325
    .local v0, "SPDupdate":Z
    iget-object v1, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    const/4 v2, 0x2

    invoke-static {v1, v2}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 326
    const-string v1, "AASAservice"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IsAASAenabled() = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    :cond_0
    return v0
.end method

.method public allowAutoRun([Ljava/lang/String;)V
    .locals 4
    .param p1, "packageName"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 266
    const-string v1, "AASAservice"

    const-string v2, "allowAutoRun()"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 268
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->access$100()Landroid/content/pm/IPackageManager;

    move-result-object v1

    aget-object v2, p1, v0

    invoke-interface {v1, v2}, Landroid/content/pm/IPackageManager;->AASA_allowAutoRun(Ljava/lang/String;)V

    .line 269
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->isDebug()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "AASAservice"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "allowAutoRun() : ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p1, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 271
    :cond_1
    return-void
.end method

.method public allowPermission([I[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 7
    .param p1, "uid"    # [I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "pkgname"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 59
    iget-object v3, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    invoke-static {v3, v6}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 60
    array-length v2, p1

    .line 61
    .local v2, "uidsize":I
    array-length v1, p2

    .line 63
    .local v1, "pmsize":I
    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    .line 64
    const-string v3, "AASAservice"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "allowPermission() : uid = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget v5, p1, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", PackageName = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, p3, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 66
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->isDebug()Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, "AASAservice"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "allowPermission() : Permission["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, v0, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, p2, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 68
    :cond_1
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->access$100()Landroid/content/pm/IPackageManager;

    move-result-object v3

    aget v4, p1, v6

    aget-object v5, p3, v6

    invoke-interface {v3, v4, p2, v5}, Landroid/content/pm/IPackageManager;->AASA_allowByPackage(I[Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .end local v0    # "i":I
    .end local v1    # "pmsize":I
    .end local v2    # "uidsize":I
    :cond_2
    :goto_1
    return-void

    .line 70
    .restart local v1    # "pmsize":I
    .restart local v2    # "uidsize":I
    :cond_3
    const-string v3, "AASAservice"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "allowPermission() : permission = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, p2, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    if-ge v0, v2, :cond_5

    .line 72
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->isDebug()Z

    move-result v3

    if-eqz v3, :cond_4

    const-string v3, "AASAservice"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "allowPermission() : uid["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, v0, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget v5, p1, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", PackageName = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, p3, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 74
    :cond_5
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->access$100()Landroid/content/pm/IPackageManager;

    move-result-object v3

    aget-object v4, p2, v6

    invoke-interface {v3, p1, v4, p3}, Landroid/content/pm/IPackageManager;->AASA_allowByPermission([ILjava/lang/String;[Ljava/lang/String;)V

    goto :goto_1
.end method

.method public blockAutoRun([Ljava/lang/String;)V
    .locals 4
    .param p1, "packageName"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 278
    const-string v1, "AASAservice"

    const-string v2, "blockAutoRun()"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 280
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->access$100()Landroid/content/pm/IPackageManager;

    move-result-object v1

    aget-object v2, p1, v0

    invoke-interface {v1, v2}, Landroid/content/pm/IPackageManager;->AASA_blockAutoRun(Ljava/lang/String;)V

    .line 281
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->isDebug()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "AASAservice"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "blockAutoRun() : ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p1, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 284
    :cond_1
    return-void
.end method

.method public blockPermission([I[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 7
    .param p1, "uid"    # [I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "pkgname"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 85
    iget-object v3, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    invoke-static {v3, v6}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 86
    array-length v2, p1

    .line 87
    .local v2, "uidsize":I
    array-length v1, p2

    .line 89
    .local v1, "pmsize":I
    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    .line 90
    const-string v3, "AASAservice"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "blockPermission() : uid = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget v5, p1, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", PackageName = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, p3, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 92
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->isDebug()Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, "AASAservice"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "blockPermission() : Permission["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, v0, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, p2, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 94
    :cond_1
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->access$100()Landroid/content/pm/IPackageManager;

    move-result-object v3

    aget v4, p1, v6

    aget-object v5, p3, v6

    invoke-interface {v3, v4, p2, v5}, Landroid/content/pm/IPackageManager;->AASA_blockByPackage(I[Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .end local v0    # "i":I
    .end local v1    # "pmsize":I
    .end local v2    # "uidsize":I
    :cond_2
    :goto_1
    return-void

    .line 96
    .restart local v1    # "pmsize":I
    .restart local v2    # "uidsize":I
    :cond_3
    const-string v3, "AASAservice"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "blockPermission() : permission = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, p2, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    if-ge v0, v2, :cond_5

    .line 98
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->isDebug()Z

    move-result v3

    if-eqz v3, :cond_4

    const-string v3, "AASAservice"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "blockPermission() : uid["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, v0, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget v5, p1, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", PackageName = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, p3, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 100
    :cond_5
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->access$100()Landroid/content/pm/IPackageManager;

    move-result-object v3

    aget-object v4, p2, v6

    invoke-interface {v3, p1, v4, p3}, Landroid/content/pm/IPackageManager;->AASA_blockByPermission([ILjava/lang/String;[Ljava/lang/String;)V

    goto :goto_1
.end method

.method public getAASARuleVersion()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 334
    const-string v0, "AASA_"

    .line 335
    .local v0, "module":Ljava/lang/String;
    const-string v2, "0000"

    .line 336
    .local v2, "ver":Ljava/lang/String;
    const-string v1, ""

    .line 338
    .local v1, "result":Ljava/lang/String;
    const-string v3, "/data/system/.aasa/aasaRuleFile.xml"

    invoke-static {v3}, Lcom/samsung/aasaservice/AASATokenRule;->parseToken(Ljava/lang/String;)Lcom/samsung/aasaservice/AASATokenRule;

    move-result-object v3

    sput-object v3, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    .line 339
    iget-object v3, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    const/4 v4, 0x2

    invoke-static {v3, v4}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 340
    sget-object v3, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    if-eqz v3, :cond_1

    .line 341
    sget-object v3, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    invoke-virtual {v3}, Lcom/samsung/aasaservice/AASATokenRule;->getVersion()Ljava/lang/String;

    move-result-object v2

    .line 342
    const-string v3, "AASAservice"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getAASARuleVersion() : version = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    sget-object v3, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    invoke-virtual {v3}, Lcom/samsung/aasaservice/AASATokenRule;->clearAASATokenRule()V

    .line 345
    const/4 v3, 0x0

    sput-object v3, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    .line 351
    :cond_0
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 353
    return-object v1

    .line 347
    :cond_1
    const-string v3, "AASAservice"

    const-string v4, "getAASARuleVersion() : There are no rule file in /data/system/.aasa/aasaRuleFile.xml"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getAlertDialogEnableType()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 125
    const/4 v0, 0x0

    .line 126
    .local v0, "type":I
    iget-object v1, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 127
    const-string v1, "AASAservice"

    const-string v2, "getAlertDialogEnableType()"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    :cond_0
    return v0
.end method

.method public getAlertDialogVisible(Ljava/lang/String;)Z
    .locals 4
    .param p1, "pkgname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 234
    iget-object v0, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    invoke-static {v0, v3}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 235
    const-string v0, "AASAservice"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getAlertDialogVisible() : packageName = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    :cond_0
    return v3
.end method

.method public getAlertDialogVisibleAll()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 145
    const/4 v0, 0x1

    .line 147
    .local v0, "visibleset":Z
    iget-object v1, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 148
    const-string v1, "AASAservice"

    const-string v2, "getAlertDialogVisibleAll()"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    :cond_0
    return v0
.end method

.method public getAutoRunPackages()[Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 288
    const/4 v2, 0x0

    new-array v1, v2, [Ljava/lang/String;

    .line 291
    .local v1, "pklist":[Ljava/lang/String;
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->access$100()Landroid/content/pm/IPackageManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/pm/IPackageManager;->getAutoRunPackages()[Ljava/lang/String;

    move-result-object v1

    .line 292
    const-string v2, "AASAservice"

    const-string v3, "getAutoRunPackages()"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    if-eqz v1, :cond_1

    .line 294
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 295
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->isDebug()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "AASAservice"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getAutoRunPackages() : ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v1, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 298
    .end local v0    # "i":I
    :cond_1
    const-string v2, "AASAservice"

    const-string v3, "getAutoRUnPackages() : NULL"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    :cond_2
    return-object v1
.end method

.method public getBlockedAutoRunPackages()[Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 244
    const/4 v2, 0x0

    new-array v1, v2, [Ljava/lang/String;

    .line 247
    .local v1, "pklist":[Ljava/lang/String;
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->access$100()Landroid/content/pm/IPackageManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/pm/IPackageManager;->getBlockedAutoRunPackages()[Ljava/lang/String;

    move-result-object v1

    .line 249
    if-eqz v1, :cond_1

    .line 250
    const-string v2, "AASAservice"

    const-string v3, "getBlockedAutoRunPackages()"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 252
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->isDebug()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "AASAservice"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getBlockedAutoRunPackages() : ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v1, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 256
    .end local v0    # "i":I
    :cond_1
    const-string v2, "AASAservice"

    const-string v3, "getBlockedAutoRunPackages() : NULL"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    :cond_2
    return-object v1
.end method

.method public getErrorCode()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 412
    const/4 v0, 0x0

    .line 413
    .local v0, "errorcode":I
    iget-object v1, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    const/4 v2, 0x2

    invoke-static {v1, v2}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 414
    sget-object v1, Lcom/samsung/aasaservice/AASAService;->SPD_result:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    invoke-virtual {v1}, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->ordinal()I

    move-result v0

    .line 417
    :cond_0
    return v0
.end method

.method public getManagedPackages(Ljava/lang/String;)[Ljava/lang/String;
    .locals 5
    .param p1, "permission"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 198
    new-array v1, v3, [Ljava/lang/String;

    .line 200
    .local v1, "pklist":[Ljava/lang/String;
    iget-object v2, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    invoke-static {v2, v3}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 201
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->access$100()Landroid/content/pm/IPackageManager;

    move-result-object v2

    invoke-interface {v2, p1}, Landroid/content/pm/IPackageManager;->getManagedPackages(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 203
    if-eqz v1, :cond_1

    .line 204
    const-string v2, "AASAservice"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getManagedPackages() : Permission = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 206
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->isDebug()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "AASAservice"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getManagedPackages() : ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v1, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 209
    .end local v0    # "i":I
    :cond_1
    const/4 v2, 0x0

    .line 212
    :goto_1
    return-object v2

    :cond_2
    move-object v2, v1

    goto :goto_1
.end method

.method public getManagedPermissions(ILjava/lang/String;)[Ljava/lang/String;
    .locals 5
    .param p1, "uid"    # I
    .param p2, "pkgname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 175
    new-array v1, v3, [Ljava/lang/String;

    .line 177
    .local v1, "pmlist":[Ljava/lang/String;
    iget-object v2, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    invoke-static {v2, v3}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 178
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->access$100()Landroid/content/pm/IPackageManager;

    move-result-object v2

    invoke-interface {v2, p1, p2}, Landroid/content/pm/IPackageManager;->getManagedPermissions(ILjava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 180
    if-nez v1, :cond_0

    .line 181
    const/4 v2, 0x0

    .line 191
    :goto_0
    return-object v2

    .line 183
    :cond_0
    const-string v2, "AASAservice"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getManagedPermissions() : uid = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", PackageName = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 186
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->isDebug()Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "AASAservice"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getManagedPermissions() : ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v1, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    move-object v2, v1

    .line 188
    goto :goto_0

    .end local v0    # "i":I
    :cond_3
    move-object v2, v1

    .line 191
    goto :goto_0
.end method

.method public getPackageManaged()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 165
    iget-object v0, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    invoke-static {v0, v2}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 166
    const-string v0, "AASAservice"

    const-string v1, "getPackageManaged()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    :cond_0
    return v2
.end method

.method public isBlockedAutoRunPackage(Ljava/lang/String;)Z
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 308
    const/4 v0, 0x0

    .line 311
    .local v0, "result":Z
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->access$100()Landroid/content/pm/IPackageManager;

    move-result-object v1

    invoke-interface {v1, p1}, Landroid/content/pm/IPackageManager;->isBlockedAutoRunPackage(Ljava/lang/String;)Z

    move-result v0

    .line 312
    const-string v1, "AASAservice"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isBlockedAutoRunPackage() : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    return v0
.end method

.method public removeBlockedPackageData(Ljava/lang/String;)V
    .locals 3
    .param p1, "pkgname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 218
    iget-object v0, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 219
    const-string v0, "AASAservice"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "removeBlockedPackageData() : packageName = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    :cond_0
    return-void
.end method

.method public setAlertDialogEnableType(I)V
    .locals 2
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 107
    iget-object v0, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    packed-switch p1, :pswitch_data_0

    .line 116
    const-string v0, "AASAservice"

    const-string v1, "setAlertDialogEnableType() = TYPE IS WRONG!!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    :cond_0
    :goto_0
    return-void

    .line 110
    :pswitch_0
    const-string v0, "AASAservice"

    const-string v1, "setAlertDialogEnableType() = Always"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 113
    :pswitch_1
    const-string v0, "AASAservice"

    const-string v1, "setAlertDialogEnableType() = Once"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 108
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public setAlertDialogVisible(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "pkgname"    # Ljava/lang/String;
    .param p2, "enabled"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 226
    iget-object v0, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 227
    const-string v1, "AASAservice"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setAlertDialogVisible() : packageName = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", state = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz p2, :cond_1

    const-string v0, "Enable"

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    :cond_0
    return-void

    .line 227
    :cond_1
    const-string v0, "Disable"

    goto :goto_0
.end method

.method public setAlertDialogVisibleAll(Z)V
    .locals 3
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 137
    iget-object v0, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 138
    const-string v0, "AASAservice"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setAlertDialogVisibleALL() = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    :cond_0
    return-void
.end method

.method public setPackageManaged(Z)V
    .locals 3
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 157
    iget-object v0, p0, Lcom/samsung/aasaservice/AASAService$1;->this$0:Lcom/samsung/aasaservice/AASAService;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/samsung/aasaservice/AASAService;->access$000(Lcom/samsung/aasaservice/AASAService;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 158
    const-string v0, "AASAservice"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setPackageManaged() = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    :cond_0
    return-void
.end method
