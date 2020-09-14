.class public Lcom/samsung/aasaservice/AASAService;
.super Landroid/app/Service;
.source "AASAService.java"


# static fields
.field static SPD_result:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

.field static confirmedVersion:I

.field private static mPm:Landroid/content/pm/IPackageManager;

.field static rule:Lcom/samsung/aasaservice/AASATokenRule;


# instance fields
.field private final mBinder:Lcom/samsung/aasaservice/IAASA$Stub;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const/4 v0, 0x0

    sput v0, Lcom/samsung/aasaservice/AASAService;->confirmedVersion:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 50
    new-instance v0, Lcom/samsung/aasaservice/AASAService$1;

    invoke-direct {v0, p0}, Lcom/samsung/aasaservice/AASAService$1;-><init>(Lcom/samsung/aasaservice/AASAService;)V

    iput-object v0, p0, Lcom/samsung/aasaservice/AASAService;->mBinder:Lcom/samsung/aasaservice/IAASA$Stub;

    return-void
.end method

.method static synthetic access$000(Lcom/samsung/aasaservice/AASAService;I)Z
    .locals 1
    .param p0, "x0"    # Lcom/samsung/aasaservice/AASAService;
    .param p1, "x1"    # I

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/samsung/aasaservice/AASAService;->checkPackages(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100()Landroid/content/pm/IPackageManager;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/samsung/aasaservice/AASAService;->mPm:Landroid/content/pm/IPackageManager;

    return-object v0
.end method

.method static synthetic access$200(Lcom/samsung/aasaservice/AASAService;Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Lcom/samsung/aasaservice/AASAService;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/samsung/aasaservice/AASAService;->checkExistPackage(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/samsung/aasaservice/AASAService;Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;)Z
    .locals 1
    .param p0, "x0"    # Lcom/samsung/aasaservice/AASAService;
    .param p1, "x1"    # Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/samsung/aasaservice/AASAService;->checkTokentarget(Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;)Z

    move-result v0

    return v0
.end method

.method private checkExistPackage(Ljava/lang/String;)Z
    .locals 9
    .param p1, "pkName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 462
    invoke-virtual {p0}, Lcom/samsung/aasaservice/AASAService;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 463
    .local v4, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {v4, v5}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v3

    .line 465
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ApplicationInfo;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ApplicationInfo;

    .line 466
    .local v0, "applicationinfo":Landroid/content/pm/ApplicationInfo;
    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 467
    .local v2, "installpkName":Ljava/lang/String;
    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 468
    const-string v5, "AASAservice"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "checkExistPackage() : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " is Exist"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 469
    const/4 v5, 0x1

    .line 473
    .end local v0    # "applicationinfo":Landroid/content/pm/ApplicationInfo;
    .end local v2    # "installpkName":Ljava/lang/String;
    :goto_0
    return v5

    .line 472
    :cond_1
    const-string v6, "AASAservice"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "checkExistPackage() : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " is not Exist"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private checkPackages(I)Z
    .locals 8
    .param p1, "moduleName"    # I

    .prologue
    const/4 v5, 0x0

    .line 589
    new-array v1, v5, [Ljava/lang/String;

    .line 591
    .local v1, "checkList":[Ljava/lang/String;
    iget-object v6, p0, Lcom/samsung/aasaservice/AASAService;->mBinder:Lcom/samsung/aasaservice/IAASA$Stub;

    invoke-static {}, Lcom/samsung/aasaservice/IAASA$Stub;->getCallingUid()I

    move-result v4

    .line 592
    .local v4, "uid":I
    invoke-virtual {p0}, Lcom/samsung/aasaservice/AASAService;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object v0

    .line 594
    .local v0, "PackageName":[Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 608
    :goto_0
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v6, v1

    if-ge v2, v6, :cond_2

    .line 609
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_2
    array-length v6, v0

    if-ge v3, v6, :cond_1

    .line 610
    aget-object v6, v0, v3

    aget-object v7, v1, v2

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 611
    const-string v5, "AASAservice"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "uid = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", Calling Package Name = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, v0, v3

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 612
    const/4 v5, 0x1

    .line 617
    .end local v3    # "j":I
    :goto_3
    return v5

    .line 596
    .end local v2    # "i":I
    :pswitch_0
    sget-object v1, Lcom/samsung/aasaservice/AASAConstants;->ACCESS_APP_PERMISSIONS:[Ljava/lang/String;

    .line 597
    goto :goto_0

    .line 599
    :pswitch_1
    sget-object v1, Lcom/samsung/aasaservice/AASAConstants;->ACCESS_AUTORUN:[Ljava/lang/String;

    .line 600
    goto :goto_0

    .line 602
    :pswitch_2
    sget-object v1, Lcom/samsung/aasaservice/AASAConstants;->ACCESS_SPD_UPDATE:[Ljava/lang/String;

    .line 603
    goto :goto_0

    .line 609
    .restart local v2    # "i":I
    .restart local v3    # "j":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 608
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 616
    .end local v3    # "j":I
    :cond_2
    const-string v6, "AASAservice"

    const-string v7, "checkPackages() : This package can\'t access AASAservice."

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 594
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private checkTokentarget(Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;)Z
    .locals 11
    .param p1, "pk"    # Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 478
    iget-object v4, p1, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->modelName:[Ljava/lang/String;

    .line 479
    .local v4, "rule_model":[Ljava/lang/String;
    iget-object v3, p1, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->carrier:[Ljava/lang/String;

    .line 481
    .local v3, "rule_carrier":[Ljava/lang/String;
    const-string v7, "ro.product.model"

    invoke-static {v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 482
    .local v6, "target_model":Ljava/lang/String;
    const-string v7, "ril.sales_code"

    invoke-static {v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 484
    .local v5, "target_carrier":Ljava/lang/String;
    const/4 v2, 0x0

    .line 486
    .local v2, "result":Z
    const-string v7, "ALL"

    aget-object v8, v4, v9

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 487
    array-length v7, v4

    if-ne v7, v10, :cond_5

    .line 488
    const-string v7, "ALL"

    aget-object v8, v3, v9

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 489
    array-length v7, v3

    if-ne v7, v10, :cond_1

    .line 490
    const/4 v2, 0x1

    .line 582
    :cond_0
    :goto_0
    const-string v7, "AASAservice"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "checkTokentarget() : result = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 584
    return v2

    .line 492
    :cond_1
    const/4 v2, 0x1

    .line 493
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_1
    array-length v7, v3

    if-ge v0, v7, :cond_0

    .line 494
    aget-object v7, v3, v0

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 495
    const/4 v2, 0x0

    .line 496
    goto :goto_0

    .line 493
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 500
    .end local v0    # "i":I
    :cond_3
    const-string v7, "ALL"

    aget-object v8, v3, v9

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 501
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    array-length v7, v3

    if-ge v0, v7, :cond_0

    .line 502
    aget-object v7, v3, v0

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 503
    const/4 v2, 0x1

    .line 504
    goto :goto_0

    .line 501
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 509
    .end local v0    # "i":I
    :cond_5
    const/4 v2, 0x1

    .line 512
    const/4 v0, 0x1

    .restart local v0    # "i":I
    :goto_3
    array-length v7, v4

    if-ge v0, v7, :cond_6

    .line 513
    aget-object v7, v4, v0

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 514
    const/4 v2, 0x0

    .line 519
    :cond_6
    if-ne v2, v10, :cond_0

    .line 520
    const-string v7, "ALL"

    aget-object v8, v3, v9

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 521
    array-length v7, v3

    if-ne v7, v10, :cond_8

    .line 522
    const/4 v2, 0x1

    goto :goto_0

    .line 512
    :cond_7
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 524
    :cond_8
    const/4 v0, 0x1

    :goto_4
    array-length v7, v3

    if-ge v0, v7, :cond_0

    .line 525
    aget-object v7, v3, v0

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 526
    const/4 v2, 0x0

    .line 527
    goto :goto_0

    .line 524
    :cond_9
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 531
    :cond_a
    const-string v7, "ALL"

    aget-object v8, v3, v9

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 532
    const/4 v2, 0x0

    .line 533
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_5
    array-length v7, v3

    if-ge v1, v7, :cond_0

    .line 534
    aget-object v7, v3, v1

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 535
    const/4 v2, 0x1

    .line 536
    goto/16 :goto_0

    .line 533
    :cond_b
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 542
    .end local v0    # "i":I
    .end local v1    # "j":I
    :cond_c
    const-string v7, "ALL"

    aget-object v8, v4, v9

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 545
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_6
    array-length v7, v4

    if-ge v0, v7, :cond_d

    .line 546
    aget-object v7, v4, v0

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_e

    .line 547
    const/4 v2, 0x1

    .line 552
    :cond_d
    if-ne v2, v10, :cond_0

    .line 553
    const-string v7, "ALL"

    aget-object v8, v3, v9

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_12

    .line 554
    array-length v7, v3

    if-ne v7, v10, :cond_10

    .line 555
    const/4 v2, 0x0

    .line 556
    const/4 v0, 0x0

    :goto_7
    array-length v7, v4

    if-ge v0, v7, :cond_0

    .line 557
    aget-object v7, v4, v0

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 558
    const/4 v2, 0x1

    .line 559
    goto/16 :goto_0

    .line 545
    :cond_e
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 556
    :cond_f
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 563
    :cond_10
    const/4 v0, 0x1

    :goto_8
    array-length v7, v3

    if-ge v0, v7, :cond_0

    .line 564
    aget-object v7, v3, v0

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_11

    .line 565
    const/4 v2, 0x0

    .line 566
    goto/16 :goto_0

    .line 563
    :cond_11
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 570
    :cond_12
    const-string v7, "ALL"

    aget-object v8, v3, v9

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 571
    const/4 v2, 0x0

    .line 572
    const/4 v1, 0x0

    .restart local v1    # "j":I
    :goto_9
    array-length v7, v3

    if-ge v1, v7, :cond_0

    .line 573
    aget-object v7, v3, v1

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13

    .line 574
    const/4 v2, 0x1

    .line 575
    goto/16 :goto_0

    .line 572
    :cond_13
    add-int/lit8 v1, v1, 0x1

    goto :goto_9
.end method

.method protected static getConfirmRuleVersion()I
    .locals 11

    .prologue
    .line 424
    const/4 v7, 0x0

    .line 425
    .local v7, "ver_int":I
    const-string v3, "/data/system/.aasa/version.txt"

    .line 429
    .local v3, "filePath":Ljava/lang/String;
    :try_start_0
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_0

    .line 430
    const-string v8, "AASAservice"

    const-string v9, "getConfirmRuleVersion() : Version File is not exist."

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    const/4 v7, 0x0

    .line 457
    :goto_0
    return v7

    .line 435
    :cond_0
    new-instance v6, Ljava/io/FileReader;

    const-string v8, "/data/system/.aasa/version.txt"

    invoke-direct {v6, v8}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 436
    .local v6, "verFile":Ljava/io/FileReader;
    if-nez v6, :cond_1

    .line 437
    const-string v8, "AASAservice"

    const-string v9, "getConfirmRuleVersion() : Version File is not exist."

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 438
    const/4 v7, 0x0

    goto :goto_0

    .line 440
    :cond_1
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 443
    .local v0, "br":Ljava/io/BufferedReader;
    :goto_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, "readline":Ljava/lang/String;
    if-eqz v4, :cond_2

    .line 444
    const-string v8, ": "

    invoke-virtual {v4, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 445
    .local v5, "splitVer":[Ljava/lang/String;
    const/4 v8, 0x1

    aget-object v8, v5, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .line 446
    const-string v8, "AASAservice"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getConfirmRuleVersion() : version = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/4 v10, 0x1

    aget-object v10, v5, v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 451
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v4    # "readline":Ljava/lang/String;
    .end local v5    # "splitVer":[Ljava/lang/String;
    .end local v6    # "verFile":Ljava/io/FileReader;
    :catch_0
    move-exception v2

    .line 452
    .local v2, "e1":Ljava/io/FileNotFoundException;
    invoke-virtual {v2}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 448
    .end local v2    # "e1":Ljava/io/FileNotFoundException;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    .restart local v4    # "readline":Ljava/lang/String;
    .restart local v6    # "verFile":Ljava/io/FileReader;
    :cond_2
    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 449
    invoke-virtual {v6}, Ljava/io/FileReader;->close()V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 453
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v4    # "readline":Ljava/lang/String;
    .end local v6    # "verFile":Ljava/io/FileReader;
    :catch_1
    move-exception v1

    .line 454
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method protected static isDebug()Z
    .locals 2

    .prologue
    .line 621
    const-string v1, "ro.debug_level"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 623
    .local v0, "logLevel":Ljava/lang/String;
    const-string v1, "0x4f4c"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 624
    const/4 v1, 0x1

    .line 627
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/samsung/aasaservice/AASAService;->mBinder:Lcom/samsung/aasaservice/IAASA$Stub;

    return-object v0
.end method

.method public onCreate()V
    .locals 2

    .prologue
    .line 38
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 39
    const-string v0, "AASAservice"

    const-string v1, "onCreate()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->getConfirmRuleVersion()I

    move-result v0

    sput v0, Lcom/samsung/aasaservice/AASAService;->confirmedVersion:I

    .line 41
    const-string v0, "package"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Landroid/content/pm/IPackageManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/content/pm/IPackageManager;

    move-result-object v0

    sput-object v0, Lcom/samsung/aasaservice/AASAService;->mPm:Landroid/content/pm/IPackageManager;

    .line 42
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 46
    const-string v0, "AASAservice"

    const-string v1, "onDestroy()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 48
    return-void
.end method
