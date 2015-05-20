/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20130517-64 [May 17 2013]
 * Copyright (c) 2000 - 2013 Intel Corporation
 * 
 * Disassembly of dsdt.aml, Fri Aug  2 05:48:46 2013
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0000AAC4 (43716)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0xFD
 *     OEM ID           "ACRSYS"
 *     OEM Table ID     "ACRPRDCT"
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20130517 (538117399)
 */
DefinitionBlock ("dsdt.aml", "DSDT", 1, "ACRSYS", "ACRPRDCT", 0x00000001)
{
    Name (SP2O, 0x4E)
    Name (SP1O, 0x164E)
    Name (IO1B, 0x0600)
    Name (IO1L, 0x70)
    Name (IO2B, 0x0680)
    Name (IO2L, 0x20)
    Name (IO3B, 0x0290)
    Name (IO3L, 0x10)
    Name (MCHB, 0xFED10000)
    Name (MCHL, 0x4000)
    Name (EGPB, 0xFED19000)
    Name (EGPL, 0x1000)
    Name (DMIB, 0xFED18000)
    Name (DMIL, 0x1000)
    Name (IFPB, 0xFED14000)
    Name (IFPL, 0x1000)
    Name (PEBS, 0xE0000000)
    Name (PELN, 0x10000000)
    Name (TTTB, 0xFED20000)
    Name (TTTL, 0x00020000)
    Name (SMBS, 0xEFA0)
    Name (PBLK, 0x0410)
    Name (PMBS, 0x0400)
    Name (PMLN, 0x80)
    Name (LVL2, 0x0414)
    Name (LVL3, 0x0415)
    Name (LVL4, 0x0416)
    Name (SMIP, 0xB2)
    Name (GPBS, 0x0500)
    Name (GPLN, 0x40)
    Name (APCB, 0xFEC00000)
    Name (APCL, 0x1000)
    Name (PM30, 0x0430)
    Name (SRCB, 0xFED1C000)
    Name (SRCL, 0x4000)
    Name (SUSW, 0xFF)
    Name (ACPH, 0xDE)
    Name (ASSB, Zero)
    Name (AOTB, Zero)
    Name (AAXB, Zero)
    Name (PEHP, One)
    Name (SHPC, One)
    Name (PEPM, One)
    Name (PEER, One)
    Name (PECS, One)
    Name (ITKE, Zero)
    Name (TRTP, One)
    Name (TRTD, 0x02)
    Name (TRTI, 0x03)
    Name (GCDD, One)
    Name (DSTA, 0x0A)
    Name (DSLO, 0x0C)
    Name (DSLC, 0x0E)
    Name (PITS, 0x10)
    Name (SBCS, 0x12)
    Name (SALS, 0x13)
    Name (LSSS, 0x2A)
    Name (PSSS, 0x2B)
    Name (SOOT, 0x35)
    Name (ESCS, 0x48)
    Name (PDBR, 0x4D)
    Name (SMBL, 0x10)
    OperationRegion (GPIO, SystemIO, 0x0500, 0x3C)
    Field (GPIO, ByteAcc, NoLock, Preserve)
    {
        Offset (0x2C), 
        Offset (0x2D), 
            ,   3, 
        LPDL,   1
    }

    OperationRegion (PMBA, SystemIO, 0x0400, 0x80)
    Field (PMBA, ByteAcc, NoLock, Preserve)
    {
        Offset (0x28), 
            ,   2, 
        SPST,   1, 
        Offset (0x42), 
            ,   1, 
        GPEC,   1, 
        Offset (0x64), 
            ,   9, 
        SCIS,   1, 
        Offset (0x66)
    }

    OperationRegion (RCRB, SystemMemory, 0xFED1C000, 0x4000)
    Field (RCRB, DWordAcc, Lock, Preserve)
    {
        Offset (0x1000), 
        Offset (0x3000), 
        Offset (0x3404), 
        HPAS,   2, 
            ,   5, 
        HPAE,   1, 
        Offset (0x3418), 
            ,   1, 
        PATD,   1, 
        SATD,   1, 
        SMBD,   1, 
        HDAD,   1, 
        Offset (0x341A), 
        RP1D,   1, 
        RP2D,   1, 
        RP3D,   1, 
        RP4D,   1, 
        RP5D,   1, 
        RP6D,   1
    }

    OperationRegion (MBOX, SystemMemory, 0xBFEBEC18, 0x02BC)
    Field (MBOX, AnyAcc, NoLock, Preserve)
    {
        PCI1,   8, 
        PCI2,   8, 
        PCI3,   8, 
        PCI4,   8, 
        PCI5,   8, 
        PCI6,   8, 
        PCI7,   8, 
        PCI8,   8, 
        NLCK,   8, 
        ZIPE,   8, 
        COMA,   8, 
        CAIO,   8, 
        CAIP,   8, 
        CAMD,   8, 
        CADA,   8, 
        COMB,   8, 
        CBIO,   8, 
        CBIP,   8, 
        CBMD,   8, 
        CBDA,   8, 
        FHSD,   8, 
        COMC,   8, 
        CCIO,   8, 
        CCIP,   8, 
        CCMD,   8, 
        CCDA,   8, 
        COMD,   8, 
        CDIO,   8, 
        CDIP,   8, 
        CDMD,   8, 
        CDDA,   8, 
        LPT1,   8, 
        L1IO,   8, 
        L1IP,   8, 
        L1MD,   8, 
        L1DA,   8, 
        LPT2,   8, 
        L2IO,   8, 
        L2IP,   8, 
        L2MD,   8, 
        L2DA,   8, 
        LPT3,   8, 
        L3IO,   8, 
        L3IP,   8, 
        L3MD,   8, 
        L3DA,   8, 
        FDDC,   8, 
        FDWP,   8, 
        HGMP,   8, 
        LGMP,   8, 
        MIDI,   8, 
        AZLA,   8, 
        AUDO,   8, 
        MODM,   8, 
        IDEC,   8, 
        SSED,   8, 
        PACT,   8, 
        SCFG,   8, 
        AMOD,   8, 
        IMOD,   8, 
        LCFG,   8, 
        IDLY,   8, 
        PMTP,   8, 
        PMIO,   8, 
        PMBM,   8, 
        PMTM,   8, 
        PSTP,   8, 
        PSIO,   8, 
        PSBM,   8, 
        PSTM,   8, 
        IDE0,   8, 
        IDE1,   8, 
        IDE2,   8, 
        IDE3,   8, 
        IDE4,   8, 
        IDE5,   8, 
        IDE6,   8, 
        IDE7,   8, 
        HIUB,   8, 
        LUBS,   8, 
        PLYT,   8, 
        EDCG,   8, 
        SDFY,   8, 
        SDTC,   8, 
        SDRP,   8, 
        SDCL,   8, 
        SDRC,   8, 
        SDRE,   8, 
        FC2L,   8, 
        FC3L,   8, 
        FCS4,   8, 
        APIM,   8, 
        HPTS,   8, 
        HPTA,   8, 
        EMAS,   8, 
        VGAO,   8, 
        SOFF,   8, 
        KBPO,   8, 
        MSPO,   8, 
        USBB,   8, 
        EVTL,   8, 
        SYBE,   8, 
        ETLC,   8, 
        AC30,   8, 
        TPMD,   8, 
        TPMO,   8, 
        TPMC,   8, 
        TPMM,   8, 
        TPCC,   8, 
        TPLC,   8, 
        TPLR,   32, 
        QBOT,   8, 
        BOTQ,   8, 
        PBOT,   8, 
        M256,   8, 
        PEGF,   8, 
        OSYS,   16, 
        BMTP,   8, 
        BNPT,   8, 
        LNMT,   8, 
        NBTO,   8, 
        NABD,   8, 
        NEBD,   8, 
        NLBD,   8, 
        DFBT,   16, 
        NPSP,   16, 
        LANG,   8, 
        UACL,   8, 
        SUPS,   8, 
        DVET,   8, 
        S3RS,   8, 
        DAS1,   8, 
        DAS3,   8, 
        WKPM,   8, 
        WKMD,   8, 
        WKS5,   8, 
        HOUR,   8, 
        MINS,   8, 
        SECS,   8, 
        DOFM,   8, 
        NBTV,   64, 
        BTOD,   64, 
        SPVP,   16, 
        POPW,   16, 
        USPW,   16, 
        HDPW,   16, 
        KRSV,   480, 
        LANE,   8, 
        AORS,   8, 
        P0HP,   8, 
        P1HP,   8, 
        P4HP,   8, 
        P5HP,   8, 
        P0IL,   8, 
        P1IL,   8, 
        P2IL,   8, 
        PEGS,   8, 
        D2F1,   8, 
        IGMT,   8, 
        DTSZ,   8, 
        CLKC,   8, 
        CKSC,   8, 
        BOTT,   8, 
        PANT,   8, 
        TVTP,   8, 
        U201,   8, 
        U202,   8, 
        U111,   8, 
        U112,   8, 
        U113,   8, 
        U114,   8, 
        U115,   8, 
        UPPC,   8, 
        UP00,   8, 
        UP01,   8, 
        UP02,   8, 
        UP03,   8, 
        UP04,   8, 
        UP05,   8, 
        UP06,   8, 
        UP07,   8, 
        UP08,   8, 
        UP09,   8, 
        UP10,   8, 
        UP11,   8, 
        P80R,   8, 
        WDOG,   8, 
        WDTO,   16, 
        WDTB,   16, 
        MASF,   8, 
        MAMT,   8, 
        ABXP,   8, 
        SPIL,   8, 
        PWDW,   8, 
        HETO,   8, 
        AWTR,   16, 
        EOPT,   8, 
        ASFB,   8, 
        MBTX,   8, 
        IDER,   8, 
        SOLE,   8, 
        PRE0,   8, 
        PRE1,   8, 
        PRE2,   8, 
        PRE3,   8, 
        PRE4,   8, 
        PRE5,   8, 
        PRA0,   8, 
        PRA1,   8, 
        PRA2,   8, 
        PRA3,   8, 
        PRA4,   8, 
        PRA5,   8, 
        PRV0,   8, 
        PRV1,   8, 
        PRV2,   8, 
        PRV3,   8, 
        PRV4,   8, 
        PRV5,   8, 
        PAA0,   8, 
        PAA1,   8, 
        PAA2,   8, 
        PAA3,   8, 
        PAA4,   8, 
        PAA5,   8, 
        L0S0,   8, 
        L0S1,   8, 
        L0S2,   8, 
        L0S3,   8, 
        L0S4,   8, 
        L0S5,   8, 
        AL10,   8, 
        AL11,   8, 
        AL12,   8, 
        AL13,   8, 
        AL14,   8, 
        AL15,   8, 
        PES0,   8, 
        PES1,   8, 
        PES2,   8, 
        PES3,   8, 
        PES4,   8, 
        PES5,   8, 
        PRU0,   8, 
        PRU1,   8, 
        PRU2,   8, 
        PRU3,   8, 
        PRU4,   8, 
        PRU5,   8, 
        PRF0,   8, 
        PRF1,   8, 
        PRF2,   8, 
        PRF3,   8, 
        PRF4,   8, 
        PRF5,   8, 
        PRN0,   8, 
        PRN1,   8, 
        PRN2,   8, 
        PRN3,   8, 
        PRN4,   8, 
        PRN5,   8, 
        PRC0,   8, 
        PRC1,   8, 
        PRC2,   8, 
        PRC3,   8, 
        PRC4,   8, 
        PRC5,   8, 
        CTD0,   8, 
        CTD1,   8, 
        CTD2,   8, 
        CTD3,   8, 
        CTD4,   8, 
        CTD5,   8, 
        PIE0,   8, 
        PIE1,   8, 
        PIE2,   8, 
        PIE3,   8, 
        PIE4,   8, 
        PIE5,   8, 
        SFE0,   8, 
        SFE1,   8, 
        SFE2,   8, 
        SFE3,   8, 
        SFE4,   8, 
        SFE5,   8, 
        SNE0,   8, 
        SNE1,   8, 
        SNE2,   8, 
        SNE3,   8, 
        SNE4,   8, 
        SNE5,   8, 
        SCE0,   8, 
        SCE1,   8, 
        SCE2,   8, 
        SCE3,   8, 
        SCE4,   8, 
        SCE5,   8, 
        MCE0,   8, 
        MCE1,   8, 
        MCE2,   8, 
        MCE3,   8, 
        MCE4,   8, 
        MCE5,   8, 
        PCE0,   8, 
        PCE1,   8, 
        PCE2,   8, 
        PCE3,   8, 
        PCE4,   8, 
        PCE5,   8, 
        PTC0,   8, 
        PTC1,   8, 
        PTC2,   8, 
        PTC3,   8, 
        PTC4,   8, 
        PTC5,   8, 
        DAPM,   8, 
        DPMA,   8, 
        DL0S,   8, 
        DAL1,   8, 
        PEGA,   8, 
        PGAA,   8, 
        PGL0,   8, 
        PL0A,   8, 
        PGL1,   8, 
        PGES,   8, 
        PAVP,   8, 
        ISTC,   8, 
        TRML,   8, 
        FNON,   8, 
        TRON,   8, 
        NXMD,   8, 
        PCRR,   8, 
        C4EN,   8, 
        C43D,   8, 
        EMTT,   8, 
        PROH,   8, 
        DFSB,   8, 
        TUBM,   8, 
        TSTE,   8, 
        BPST,   8, 
        QKS4,   8, 
        POPU,   8, 
        POPD,   8, 
        C4ET,   8, 
        NXFE,   8, 
        VTST,   8, 
        VTFE,   8, 
        S5FG,   8, 
        CSTS,   8, 
        ENCS,   8, 
        DEC4,   8, 
        HC4E,   8, 
        ENC6,   8, 
        CSTR,   8, 
        CMPE,   8, 
        CSMD,   8, 
        DTSE,   8, 
        DTSC,   8, 
        RAID,   8, 
        PSHM,   8, 
        PEXC,   8, 
        DTST,   8, 
        TXTS,   8, 
        VTDE,   8, 
        SMRR,   8, 
        CART,   8, 
        CATT,   8, 
        ITPM,   8, 
        STBE,   8, 
        PEBE,   8, 
        PCBE,   8, 
        EHBE,   8, 
        UHBE,   8, 
        HABE,   8, 
        ERS2,   8, 
        CRSV,   552, 
        ORSV,   560, 
        SPW0,   8, 
        SPW1,   8, 
        D2DE,   8, 
        F12M,   8, 
        MWDT,   16, 
        POWT,   16, 
        DRSV,   736
    }

    OperationRegion (SMIO, SystemIO, 0xB2, 0x02)
    Field (SMIO, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMD,   8
    }

    Method (OSMI, 1, NotSerialized)
    {
        Store (Arg0, APMD)
        Store (0xB2, APMC)
        Stall (0xFF)
        Stall (0xFF)
        Stall (0xFF)
        Stall (0xFF)
        Stall (0xFF)
        Stall (0xFF)
    }

    OperationRegion (IO_T, SystemIO, 0x0800, 0x10)
    Field (IO_T, ByteAcc, NoLock, Preserve)
    {
        Offset (0x02), 
        Offset (0x04), 
        Offset (0x06), 
        Offset (0x08), 
        TRP0,   8, 
        Offset (0x0A), 
        Offset (0x0B), 
        Offset (0x0C), 
        Offset (0x0D), 
        Offset (0x0E), 
        Offset (0x0F), 
        Offset (0x10)
    }

    OperationRegion (IO_D, SystemIO, 0x0810, 0x08)
    Field (IO_D, ByteAcc, NoLock, Preserve)
    {
        TRPD,   8
    }

    OperationRegion (IO_H, SystemIO, 0x0400, 0x04)
    Field (IO_H, ByteAcc, NoLock, Preserve)
    {
        TRPH,   8
    }

    OperationRegion (NVST, SystemMemory, 0xBFEBEED4, 0xDE)
    Field (NVST, AnyAcc, Lock, Preserve)
    {
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        SCIF,   8, 
        PRM2,   8, 
        PRM3,   8, 
        LCKF,   8, 
        PRM4,   8, 
        PRM5,   8, 
        P80D,   32, 
        LIDS,   8, 
        PWRS,   8, 
        DBGS,   8, 
        THOF,   8, 
        ACT1,   8, 
        ACTT,   8, 
        CRTT,   8, 
        Offset (0x15), 
        DTS1,   8, 
        DTS2,   8, 
        DTSF,   8, 
        BNUM,   8, 
        APIC,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PPCM,   8, 
        PPMF,   32, 
        IGDS,   8, 
        TLST,   8, 
        CADL,   8, 
        PADL,   8, 
        CSTE,   16, 
        NSTE,   16, 
        SSTE,   16, 
        NDID,   8, 
        DID1,   32, 
        DID2,   32, 
        DID3,   32, 
        DID4,   32, 
        DID5,   32, 
        BDSP,   8, 
        PTY1,   8, 
        PTY2,   8, 
        PSCL,   8, 
        TVF1,   8, 
        TVF2,   8, 
        GETM,   8, 
        BLCS,   8, 
        BRTL,   8, 
        ALSE,   8, 
        ALAF,   8, 
        LLOW,   8, 
        LHIH,   8, 
        EMAE,   8, 
        EMAP,   16, 
        EMAL,   16, 
        MEFE,   8, 
        DSTS,   8, 
        TPMP,   8, 
        TPME,   8, 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8, 
        GTF1,   56, 
        BID,    8, 
        ASLB,   32, 
        IBTT,   8, 
        IPAT,   8, 
        ITVF,   8, 
        ITVM,   8, 
        IPSC,   8, 
        IBLC,   8, 
        IBIA,   8, 
        ISSC,   8, 
        I409,   8, 
        I509,   8, 
        I609,   8, 
        I709,   8, 
        IDMM,   8, 
        IDMS,   8, 
        IF1E,   8, 
        HVCO,   8, 
        NXD1,   32, 
        NXD2,   32, 
        NXD3,   32, 
        NXD4,   32, 
        NXD5,   32, 
        NXD6,   32, 
        NXD7,   32, 
        NXD8,   32, 
        GSMI,   8, 
        DSEN,   8, 
        ECON,   8, 
        GPIC,   8, 
        CTYP,   8, 
        L01C,   8, 
        VFN0,   8, 
        VFN1,   8, 
        LCDA,   16, 
        BVAL,   32, 
        DI00,   320, 
        TPAD,   8, 
        KBTP,   8, 
        KSV0,   32, 
        KSV1,   8
    }

    Scope (_PR)
    {
        Processor (CPU0, 0x01, 0x00000410, 0x06) {}
        Processor (CPU1, 0x02, 0x00000410, 0x06) {}
        Processor (CPU2, 0x03, 0x00000410, 0x06) {}
        Processor (CPU3, 0x04, 0x00000410, 0x06) {}
    }

    OperationRegion (PRT0, SystemIO, 0x80, 0x04)
    Field (PRT0, DWordAcc, Lock, Preserve)
    {
        P80H,   32
    }

    Method (P8XH, 2, Serialized)
    {
        If (LEqual (Arg0, Zero))
        {
            Store (Or (And (P80D, 0xFFFFFF00), Arg1), P80D)
        }

        If (LEqual (Arg0, One))
        {
            Store (Or (And (P80D, 0xFFFF00FF), ShiftLeft (Arg1, 0x08)
                ), P80D)
        }

        If (LEqual (Arg0, 0x02))
        {
            Store (Or (And (P80D, 0xFF00FFFF), ShiftLeft (Arg1, 0x10)
                ), P80D)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (Or (And (P80D, 0x00FFFFFF), ShiftLeft (Arg1, 0x18)
                ), P80D)
        }

        Store (P80D, P80H)
    }

    Method (TRAP, 2, Serialized)
    {
        Store (Arg1, SMIF)
        If (LEqual (Arg0, TRTP))
        {
            Store (Zero, TRP0)
        }

        If (LEqual (Arg0, TRTD))
        {
            Store (Arg1, DTSF)
            Store (Zero, TRPD)
            Return (DTSF)
        }

        If (LEqual (Arg0, TRTI))
        {
            Store (Zero, TRPH)
        }

        Return (SMIF)
    }

    OperationRegion (CMS1, SystemIO, 0x72, 0x02)
    Field (CMS1, ByteAcc, NoLock, Preserve)
    {
        CMSI,   8, 
        CMSD,   8
    }

    Method (CMSW, 2, NotSerialized)
    {
        Store (Arg0, CMSI)
        Store (Arg1, CMSD)
    }

    Mutex (PSMX, 0x00)
    Method (IHWM, 2, NotSerialized)
    {
        Acquire (PSMX, 0xFFFF)
        Store (Arg0, PRM0)
        Store (Arg1, DI00)
        Store (0xC1, APMC)
        Store (DI00, Local0)
        Release (PSMX)
        Return (Local0)
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        Store (0x55, P80H)
        If (LEqual (Arg0, 0x03))
        {
            Store (0x53, P80H)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x54, P80H)
            OSMI (0x82)
            \_SB.PCI0.OVGA.GLID (0x03)
            CMSW (0x3F, 0x3F)
        }

        Return (Zero)
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        If (LEqual (RP1D, Zero))
        {
            If (LEqual (\_SB.PCI0.EXP1.PDSX, One))
            {
                Notify (\_SB.PCI0.EXP1, Zero)
            }
        }

        If (LEqual (RP2D, Zero))
        {
            If (LEqual (\_SB.PCI0.EXP2.PDSX, One))
            {
                Notify (\_SB.PCI0.EXP2, Zero)
            }
        }

        If (LEqual (RP3D, Zero))
        {
            If (LEqual (\_SB.PCI0.EXP3.PDSX, One))
            {
                Notify (\_SB.PCI0.EXP3, Zero)
            }
        }

        If (LEqual (RP4D, Zero))
        {
            If (LEqual (\_SB.PCI0.EXP4.PDSX, One))
            {
                Notify (\_SB.PCI0.EXP4, Zero)
            }
        }

        If (LEqual (RP5D, Zero))
        {
            If (LEqual (\_SB.PCI0.EXP5.PDSX, One))
            {
                Notify (\_SB.PCI0.EXP5, Zero)
            }
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0xE3, P80H)
            If (LAnd (DTSE, CMPE))
            {
                Store (0x14, DTSF)
                Store (Zero, TRPD)
            }

            OSMI (0x81)
            Notify (\_SB.PCI0.EXP5, Zero)
            Notify (\_SB.PCI0.EXP1, One)
            Store (0x52, APMC)
            Notify (\_SB.PCI0.LPC.PWRB, 0x02)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0xE4, P80H)
            OSMI (0x83)
            If (LAnd (DTSE, CMPE))
            {
                Store (0x14, DTSF)
                Store (Zero, TRPD)
            }

            Notify (\_SB.PCI0.LPC.PWRB, 0x02)
        }

        Return (Zero)
    }

    If (LEqual (DAS3, One))
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x05, 
            0x05, 
            Zero, 
            Zero
        })
    }

    Name (_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x06, 
        0x06, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        0x07, 
        Zero, 
        Zero
    })
    Name (MXM2, Buffer (0x2B)
    {
        /* 0000 */   0x4D, 0x58, 0x4D, 0x5F, 0x02, 0x00, 0x23, 0x00,
        /* 0008 */   0x00, 0x00, 0xFA, 0xFF, 0xF9, 0x3E, 0x30, 0x12,
        /* 0010 */   0xB8, 0xFF, 0xF9, 0x3E, 0x20, 0x21, 0x8A, 0xF0,
        /* 0018 */   0xF9, 0x5E, 0x03, 0x64, 0x90, 0x01, 0x13, 0x64,
        /* 0020 */   0x90, 0x01, 0xE5, 0x0D, 0x11, 0x02, 0x00, 0x00,
        /* 0028 */   0x00, 0x00, 0x13
    })
    Scope (_GPE)
    {
        Method (_L01, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            If (LNotEqual (\_SB.PCI0.EXP1.VDID, 0xFFFF))
            {
                If (\_SB.PCI0.EXP1.HPSX)
                {
                    Sleep (0x05DC)
                    If (\_SB.PCI0.EXP1.PDCX)
                    {
                        Store (One, \_SB.PCI0.EXP1.PDCX)
                    }

                    Store (One, \_SB.PCI0.EXP1.HPSX)
                }
            }

            If (LNotEqual (\_SB.PCI0.EXP2.VDID, 0xFFFF))
            {
                If (\_SB.PCI0.EXP2.HPSX)
                {
                    If (\_SB.PCI0.EXP2.PDCX)
                    {
                        Store (One, \_SB.PCI0.EXP2.PDCX)
                    }

                    Store (One, \_SB.PCI0.EXP2.HPSX)
                }
            }

            If (LNotEqual (\_SB.PCI0.EXP3.VDID, 0xFFFF))
            {
                If (\_SB.PCI0.EXP3.HPSX)
                {
                    If (\_SB.PCI0.EXP3.PDCX)
                    {
                        Store (One, \_SB.PCI0.EXP3.PDCX)
                    }

                    Store (One, \_SB.PCI0.EXP3.HPSX)
                }
            }

            If (LNotEqual (\_SB.PCI0.EXP4.VDID, 0xFFFF))
            {
                If (\_SB.PCI0.EXP4.HPSX)
                {
                    If (\_SB.PCI0.EXP4.PDCX)
                    {
                        Store (One, \_SB.PCI0.EXP4.PDCX)
                    }

                    Store (One, \_SB.PCI0.EXP4.HPSX)
                }
            }

            Sleep (0x64)
            If (LNotEqual (\_SB.PCI0.EXP1.VDID, 0xFFFF))
            {
                Notify (\_SB.PCI0.EXP1, Zero)
            }

            If (LNotEqual (\_SB.PCI0.EXP2.VDID, 0xFFFF))
            {
                Notify (\_SB.PCI0.EXP2, Zero)
            }

            If (LNotEqual (\_SB.PCI0.EXP3.VDID, 0xFFFF))
            {
                Notify (\_SB.PCI0.EXP3, Zero)
            }

            If (LNotEqual (\_SB.PCI0.EXP4.VDID, 0xFFFF))
            {
                Notify (\_SB.PCI0.EXP4, Zero)
            }

            If (LAnd (LEqual (RP5D, Zero), \_SB.PCI0.EXP5.HPSX))
            {
                Store (0x70, P80H)
                Sleep (0x64)
                If (\_SB.PCI0.EXP5.PDCX)
                {
                    Store (One, \_SB.PCI0.EXP5.PDCX)
                    Store (One, \_SB.PCI0.EXP5.HPSX)
                    If (\_SB.PCI0.EXP5.PDSX)
                    {
                        Store (0x71, P80H)
                        Sleep (0x64)
                        Store (0x0A, Local2)
                        While (LGreater (Local2, Zero))
                        {
                            Store (0x72, P80H)
                            Sleep (0x64)
                            And (\_SB.PCI0.EXP5.J380.DVID, 0xFFF0FFFF, Local1)
                            If (LEqual (Local1, 0x2380197B))
                            {
                                Store (0x88, \_SB.PCI0.EXP5.J380.LAT0)
                                Store (0x80, \_SB.PCI0.EXP5.J380.PMC0)
                                Store (0x73, P80H)
                                Sleep (0x64)
                                OSMI (0x5A)
                                Store (Zero, Local2)
                            }
                            Else
                            {
                                Store (0x74, P80H)
                                Sleep (0x64)
                                Decrement (Local2)
                                Store (0x75, P80H)
                                Sleep (0x64)
                            }
                        }
                    }
                    Else
                    {
                        Sleep (0x64)
                    }

                    Notify (\_SB.PCI0.EXP5, Zero)
                }
                Else
                {
                    Store (One, \_SB.PCI0.EXP5.HPSX)
                }
            }

            Store (0x78, P80H)
        }

        Method (_L02, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Store (Zero, GPEC)
            Notify (\_TZ.TZ01, 0x80)
        }

        Method (_L06, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            If (\_SB.PCI0.OVGA.GSSE)
            {
                \_SB.PCI0.OVGA.GSCI ()
            }
            Else
            {
                Store (One, SCIS)
            }
        }

        Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.EXP1, 0x02)
            Notify (\_SB.PCI0.EXP1.PXS1, 0x02)
            Notify (\_SB.PCI0.EXP2, 0x02)
            Notify (\_SB.PCI0.EXP3, 0x02)
            Notify (\_SB.PCI0.EXP4, 0x02)
            Notify (\_SB.PCI0.EXP5, 0x02)
            Notify (\_SB.PCI0.EXP6, 0x02)
        }

        Method (_L0B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.P32, 0x02)
        }

        Method (_L03, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.UHC0, 0x02)
            Notify (\_SB.PCI0.LPC.SLPB, 0x80)
        }

        Method (_L04, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.UHC1, 0x02)
            Notify (\_SB.PCI0.LPC.SLPB, 0x80)
        }

        Method (_L0C, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.UHC2, 0x02)
            Notify (\_SB.PCI0.LPC.SLPB, 0x80)
        }

        Method (_L20, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.UHCR, 0x02)
            Notify (\_SB.PCI0.LPC.SLPB, 0x80)
        }

        Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.EHC1, 0x02)
            Notify (\_SB.PCI0.LPC.SLPB, 0x80)
        }

        Method (_L17, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.EXP5, Zero)
        }

        Method (_L1B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Not (LPDL, LPDL)
            Store (\_SB.PCI0.LPC.EC0.LIDO, Local0)
            Not (Local0, Local0)
            Add (Local0, 0x02, Local0)
            \_SB.PCI0.OVGA.GLID (Local0)
            Notify (\_SB.PCI0.LPC.LID0, 0x80)
        }

        Method (_L0E, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.UHC3, 0x02)
            Notify (\_SB.PCI0.LPC.SLPB, 0x80)
        }

        Method (_L05, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.UHC4, 0x02)
            Notify (\_SB.PCI0.LPC.SLPB, 0x80)
        }
    }

    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        Store (Arg0, GPIC)
    }

    Scope (_TZ)
    {
        ThermalZone (TZ01)
        {
            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (0x0EF8)
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (ECON)
                {
                    If (DTSE)
                    {
                        Store (DTS2, Local1)
                        If (LGreaterEqual (DTS1, DTS2))
                        {
                            Store (DTS1, Local1)
                        }

                        If (LLess (Local1, 0x6E))
                        {
                            Store (Local1, \_SB.PCI0.LPC.EC0.SKTA)
                        }
                    }

                    Store (\_SB.PCI0.LPC.EC0.CTMP, Local1)
                    Return (Add (0x0AAC, Multiply (Local1, 0x0A)))
                }

                Return (0x0BB8)
            }
        }
    }

    Method (GETP, 1, Serialized)
    {
        If (LEqual (And (Arg0, 0x09), Zero))
        {
            Return (Ones)
        }

        If (LEqual (And (Arg0, 0x09), 0x08))
        {
            Return (0x0384)
        }

        ShiftRight (And (Arg0, 0x0300), 0x08, Local0)
        ShiftRight (And (Arg0, 0x3000), 0x0C, Local1)
        Return (Multiply (0x1E, Subtract (0x09, Add (Local0, Local1))
            ))
    }

    Method (GDMA, 5, Serialized)
    {
        If (Arg0)
        {
            If (Arg1)
            {
                Return (0x14)
            }

            If (Arg2)
            {
                Return (Multiply (Subtract (0x04, Arg3), 0x0F))
            }

            Return (Multiply (Subtract (0x04, Arg3), 0x1E))
        }

        Return (Ones)
    }

    Method (GETT, 1, Serialized)
    {
        Return (Multiply (0x1E, Subtract (0x09, Add (And (ShiftRight (Arg0, 0x02
            ), 0x03), And (Arg0, 0x03)))))
    }

    Method (GETF, 3, Serialized)
    {
        Name (TMPF, Zero)
        If (Arg0)
        {
            Or (TMPF, One, TMPF)
        }

        If (And (Arg2, 0x02))
        {
            Or (TMPF, 0x02, TMPF)
        }

        If (Arg1)
        {
            Or (TMPF, 0x04, TMPF)
        }

        If (And (Arg2, 0x20))
        {
            Or (TMPF, 0x08, TMPF)
        }

        If (And (Arg2, 0x4000))
        {
            Or (TMPF, 0x10, TMPF)
        }

        Return (TMPF)
    }

    Method (SETP, 3, Serialized)
    {
        If (LGreater (Arg0, 0xF0))
        {
            Return (0x08)
        }
        Else
        {
            If (And (Arg1, 0x02))
            {
                If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
                {
                    Return (0x2301)
                }

                If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, One)))
                {
                    Return (0x2101)
                }
            }

            Return (0x1001)
        }
    }

    Method (SDMA, 1, Serialized)
    {
        If (LLessEqual (Arg0, 0x14))
        {
            Return (One)
        }

        If (LLessEqual (Arg0, 0x1E))
        {
            Return (0x02)
        }

        If (LLessEqual (Arg0, 0x2D))
        {
            Return (One)
        }

        If (LLessEqual (Arg0, 0x3C))
        {
            Return (0x02)
        }

        If (LLessEqual (Arg0, 0x5A))
        {
            Return (One)
        }

        Return (Zero)
    }

    Method (SETT, 3, Serialized)
    {
        If (And (Arg1, 0x02))
        {
            If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
            {
                Return (0x0B)
            }

            If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, One)))
            {
                Return (0x09)
            }
        }

        Return (0x04)
    }

    Scope (_SB)
    {
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03"))  // _CID: Compatible ID
            Name (_ADR, Zero)  // _ADR: Address
            Device (WMI1)
            {
                Name (_HID, "PNP0C14")  // _HID: Hardware ID
                Name (_UID, "MXM2")  // _UID: Unique ID
                Name (_WDG, Buffer (0x3C)
                {
                    /* 0000 */   0x3C, 0x5C, 0xCB, 0xF6, 0xAE, 0x9C, 0xBD, 0x4E,
                    /* 0008 */   0xB5, 0x77, 0x93, 0x1E, 0xA3, 0x2A, 0x2C, 0xC0,
                    /* 0010 */   0x4D, 0x58, 0x01, 0x02, 0x57, 0x93, 0x8A, 0xF2,
                    /* 0018 */   0x4B, 0xCF, 0x1A, 0x4A, 0x88, 0x93, 0xBB, 0x1F,
                    /* 0020 */   0x58, 0xEE, 0xA1, 0xAF, 0xD1, 0x00, 0x01, 0x08,
                    /* 0028 */   0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11,
                    /* 0030 */   0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10,
                    /* 0038 */   0x58, 0x4D, 0x01, 0x00
                })
                Method (WMMX, 3, NotSerialized)
                {
                    If (LGreaterEqual (SizeOf (Arg2), 0x04))
                    {
                        CreateDWordField (Arg2, Zero, FUNC)
                        CreateDWordField (Arg2, 0x04, ARGS)
                        If (LEqual (FUNC, 0x494D584D))
                        {
                            Return (^^PEGP.VGA.MXMI (ARGS))
                        }
                        Else
                        {
                            If (LEqual (FUNC, 0x534D584D))
                            {
                                Return (^^PEGP.VGA.MXMS (ARGS))
                            }
                            Else
                            {
                                If (LEqual (FUNC, 0x584D584D))
                                {
                                    If (LGreaterEqual (SizeOf (Arg1), 0x08))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                        }
                    }

                    Return (Zero)
                }

                Name (WQBA, Buffer (0x029C)
                {
                    /* 0000 */   0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,
                    /* 0008 */   0x8B, 0x02, 0x00, 0x00, 0x0C, 0x08, 0x00, 0x00,
                    /* 0010 */   0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,
                    /* 0018 */   0x18, 0xD2, 0x83, 0x00, 0x01, 0x06, 0x18, 0x42,
                    /* 0020 */   0x10, 0x05, 0x10, 0x8A, 0xE6, 0x80, 0x42, 0x04,
                    /* 0028 */   0x92, 0x43, 0xA4, 0x30, 0x30, 0x28, 0x0B, 0x20,
                    /* 0030 */   0x86, 0x90, 0x0B, 0x26, 0x26, 0x40, 0x04, 0x84,
                    /* 0038 */   0xBC, 0x0A, 0xB0, 0x29, 0xC0, 0x24, 0x88, 0xFA,
                    /* 0040 */   0xF7, 0x87, 0x28, 0x09, 0x0E, 0x25, 0x04, 0x42,
                    /* 0048 */   0x12, 0x05, 0x98, 0x17, 0xA0, 0x5B, 0x80, 0x61,
                    /* 0050 */   0x01, 0xB6, 0x05, 0x98, 0x16, 0xE0, 0x18, 0x92,
                    /* 0058 */   0x4A, 0x03, 0xA7, 0x04, 0x96, 0x02, 0x21, 0xA1,
                    /* 0060 */   0x02, 0x94, 0x0B, 0xF0, 0x2D, 0x40, 0x3B, 0xA2,
                    /* 0068 */   0x24, 0x0B, 0xB0, 0x0C, 0x23, 0x02, 0x8F, 0x82,
                    /* 0070 */   0xA1, 0x71, 0x68, 0xEC, 0x30, 0x2C, 0x13, 0x4C,
                    /* 0078 */   0x83, 0x38, 0x8C, 0xB2, 0x91, 0x45, 0x60, 0xDC,
                    /* 0080 */   0x4E, 0x05, 0xC8, 0x15, 0x20, 0x4C, 0x80, 0x78,
                    /* 0088 */   0x54, 0x61, 0x34, 0x07, 0x45, 0xE0, 0x42, 0x63,
                    /* 0090 */   0x64, 0x40, 0xC8, 0xA3, 0x00, 0xAB, 0xA3, 0xD0,
                    /* 0098 */   0xA4, 0x12, 0xD8, 0xBD, 0x00, 0x8D, 0x02, 0xB4,
                    /* 00A0 */   0x09, 0x70, 0x28, 0x40, 0xA1, 0x00, 0x6B, 0x18,
                    /* 00A8 */   0x72, 0x06, 0x21, 0x5B, 0xD8, 0xC2, 0x68, 0x50,
                    /* 00B0 */   0x80, 0x45, 0x14, 0x8D, 0xE0, 0x2C, 0x2A, 0x9E,
                    /* 00B8 */   0x93, 0x50, 0x02, 0xDA, 0x1B, 0x82, 0xF0, 0x8C,
                    /* 00C0 */   0xD9, 0x18, 0x9E, 0x10, 0x83, 0x54, 0x86, 0x21,
                    /* 00C8 */   0x88, 0xB8, 0x11, 0x8E, 0xA5, 0xFD, 0x41, 0x10,
                    /* 00D0 */   0xF9, 0xAB, 0xD7, 0xB8, 0x1D, 0x69, 0x34, 0xA8,
                    /* 00D8 */   0xB1, 0x26, 0x38, 0x76, 0x8F, 0xE6, 0x84, 0x3B,
                    /* 00E0 */   0x17, 0x20, 0x7D, 0x6E, 0x02, 0x39, 0xBA, 0xD3,
                    /* 00E8 */   0xA8, 0x73, 0xD0, 0x64, 0x78, 0x0C, 0x2B, 0xC1,
                    /* 00F0 */   0x7F, 0x80, 0x4F, 0x01, 0x78, 0xD7, 0x80, 0x9A,
                    /* 00F8 */   0xFE, 0xC1, 0x33, 0x41, 0x70, 0xA8, 0x21, 0x7A,
                    /* 0100 */   0xD4, 0xE1, 0x4E, 0xE0, 0xBC, 0x8E, 0x84, 0x41,
                    /* 0108 */   0x1C, 0xD1, 0x71, 0x63, 0x67, 0x75, 0x32, 0x07,
                    /* 0110 */   0x5D, 0xAA, 0x00, 0xB3, 0x07, 0x00, 0x0D, 0x2E,
                    /* 0118 */   0xC1, 0x69, 0x9F, 0x49, 0xE8, 0xF7, 0x80, 0xF3,
                    /* 0120 */   0xE9, 0x79, 0x6C, 0x6C, 0x10, 0xA8, 0x91, 0xF9,
                    /* 0128 */   0xFF, 0x0F, 0xED, 0x41, 0x9E, 0x56, 0xCC, 0x90,
                    /* 0130 */   0xCF, 0x02, 0x87, 0xC5, 0xC4, 0x1E, 0x19, 0xE8,
                    /* 0138 */   0x78, 0xC0, 0x7F, 0x00, 0x78, 0x34, 0x88, 0xF0,
                    /* 0140 */   0x66, 0xE0, 0xF9, 0x9A, 0x60, 0x50, 0x08, 0x39,
                    /* 0148 */   0x19, 0x0F, 0x4A, 0xCC, 0xF9, 0x80, 0xCC, 0x25,
                    /* 0150 */   0xC4, 0x43, 0xC0, 0x31, 0xC4, 0x08, 0x7A, 0x46,
                    /* 0158 */   0x45, 0x23, 0x6B, 0x22, 0x3E, 0x03, 0x78, 0xDC,
                    /* 0160 */   0x96, 0x05, 0x42, 0x09, 0x0C, 0xEC, 0x73, 0xC3,
                    /* 0168 */   0x3B, 0x84, 0x61, 0x71, 0xA3, 0x09, 0xEC, 0xF3,
                    /* 0170 */   0x85, 0x05, 0x0E, 0x0A, 0x05, 0xEB, 0xBB, 0x42,
                    /* 0178 */   0xCC, 0xE7, 0x81, 0xE3, 0x3C, 0x60, 0x0B, 0x9F,
                    /* 0180 */   0x28, 0x01, 0x3E, 0x24, 0x8F, 0x06, 0xDE, 0x20,
                    /* 0188 */   0xE1, 0x5B, 0x3F, 0x02, 0x10, 0xE0, 0x27, 0x06,
                    /* 0190 */   0x13, 0x58, 0x1E, 0x30, 0x7A, 0x94, 0xF6, 0x2B,
                    /* 0198 */   0x00, 0x21, 0xF8, 0x8B, 0xC5, 0x53, 0xC0, 0xEB,
                    /* 01A0 */   0x40, 0x84, 0x63, 0x81, 0x29, 0x72, 0x6C, 0x68,
                    /* 01A8 */   0x78, 0x7E, 0x70, 0x88, 0x1E, 0xF5, 0x5C, 0xC2,
                    /* 01B0 */   0x1F, 0x4D, 0x94, 0x53, 0x38, 0x1C, 0x1F, 0x39,
                    /* 01B8 */   0x8C, 0x10, 0xFE, 0x49, 0xE3, 0xC9, 0xC3, 0x9A,
                    /* 01C0 */   0xEF, 0x00, 0x9A, 0xD2, 0x5B, 0xC0, 0xFB, 0x83,
                    /* 01C8 */   0x47, 0x80, 0x11, 0x20, 0xE1, 0x68, 0x82, 0x89,
                    /* 01D0 */   0x7C, 0x3A, 0x01, 0xD5, 0xFF, 0xFF, 0x74, 0x02,
                    /* 01D8 */   0xB8, 0xBA, 0x01, 0x14, 0x37, 0x6A, 0x9D, 0x49,
                    /* 01E0 */   0x7C, 0x2C, 0xF1, 0xAD, 0xE4, 0xBC, 0x43, 0xC5,
                    /* 01E8 */   0x7F, 0x93, 0x78, 0x3A, 0xF1, 0x34, 0x1E, 0x4C,
                    /* 01F0 */   0x42, 0x44, 0x89, 0x18, 0x21, 0xA2, 0xEF, 0x27,
                    /* 01F8 */   0x46, 0x08, 0x15, 0x31, 0x6C, 0xA4, 0x37, 0x80,
                    /* 0200 */   0xE7, 0x13, 0xE3, 0x84, 0x08, 0xF4, 0x74, 0xC2,
                    /* 0208 */   0x42, 0x3E, 0x34, 0xA4, 0xE1, 0x74, 0x02, 0x50,
                    /* 0210 */   0xE0, 0xFF, 0x7F, 0x3A, 0x81, 0x1F, 0xF5, 0x74,
                    /* 0218 */   0x82, 0x1E, 0xAE, 0x4F, 0x19, 0x18, 0xE4, 0x03,
                    /* 0220 */   0xF2, 0xA9, 0xC3, 0xF7, 0x1F, 0x13, 0xF8, 0x78,
                    /* 0228 */   0xC2, 0x45, 0x1D, 0x4F, 0x50, 0xA7, 0x07, 0x1F,
                    /* 0230 */   0x4F, 0xD8, 0x19, 0xE1, 0x2C, 0x1E, 0x03, 0x7C,
                    /* 0238 */   0x3A, 0xC1, 0xDC, 0x13, 0x7C, 0x3A, 0x01, 0xDB,
                    /* 0240 */   0x68, 0x60, 0x1C, 0x4F, 0xC0, 0x77, 0x74, 0xC1,
                    /* 0248 */   0x1D, 0x4F, 0xC0, 0x30, 0x18, 0x18, 0xE7, 0x13,
                    /* 0250 */   0xE0, 0x31, 0x5E, 0xDC, 0x31, 0xC0, 0x43, 0xE0,
                    /* 0258 */   0x03, 0x78, 0xDC, 0x38, 0x3D, 0x2B, 0x9D, 0x14,
                    /* 0260 */   0xF2, 0x24, 0xC2, 0x07, 0x85, 0x39, 0xB0, 0xE0,
                    /* 0268 */   0x14, 0xDA, 0xF4, 0xA9, 0xD1, 0xA8, 0x55, 0x83,
                    /* 0270 */   0x32, 0x35, 0xCA, 0x34, 0xA8, 0xD5, 0xA7, 0x52,
                    /* 0278 */   0x63, 0xC6, 0xCE, 0x19, 0x0E, 0xF8, 0x10, 0xD0,
                    /* 0280 */   0x89, 0xC0, 0xF2, 0x9E, 0x0D, 0x02, 0xB1, 0x0C,
                    /* 0288 */   0x0A, 0x81, 0x58, 0xFA, 0xAB, 0x45, 0x20, 0x0E,
                    /* 0290 */   0x0E, 0xA2, 0xFF, 0x3F, 0x88, 0x23, 0xD2, 0x0A,
                    /* 0298 */   0xC4, 0xFF, 0x7F, 0x7F
                })
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                Store (0x12, P80H)
                Store (0x07D6, OSYS)
            }

            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            OperationRegion (HBUS, PCI_Config, 0x40, 0xC0)
            Field (HBUS, DWordAcc, NoLock, Preserve)
            {
                EPEN,   1, 
                    ,   11, 
                EPBR,   20, 
                Offset (0x08), 
                MHEN,   1, 
                    ,   13, 
                MHBR,   18, 
                Offset (0x20), 
                PXEN,   1, 
                PXSZ,   2, 
                    ,   23, 
                PXBR,   6, 
                Offset (0x28), 
                DIEN,   1, 
                    ,   11, 
                DIBR,   20, 
                Offset (0x30), 
                IPEN,   1, 
                    ,   11, 
                IPBR,   20, 
                Offset (0x50), 
                    ,   4, 
                PM0H,   2, 
                Offset (0x51), 
                PM1L,   2, 
                    ,   2, 
                PM1H,   2, 
                Offset (0x52), 
                PM2L,   2, 
                    ,   2, 
                PM2H,   2, 
                Offset (0x53), 
                PM3L,   2, 
                    ,   2, 
                PM3H,   2, 
                Offset (0x54), 
                PM4L,   2, 
                    ,   2, 
                PM4H,   2, 
                Offset (0x55), 
                PM5L,   2, 
                    ,   2, 
                PM5H,   2, 
                Offset (0x56), 
                PM6L,   2, 
                    ,   2, 
                PM6H,   2, 
                Offset (0x57), 
                    ,   7, 
                HENA,   1, 
                Offset (0x62), 
                TUUD,   16, 
                Offset (0x70), 
                    ,   4, 
                TLUD,   12, 
                Offset (0x89), 
                    ,   3, 
                GTSE,   1, 
                Offset (0x8A)
            }

            OperationRegion (MCHT, SystemMemory, 0xFED11000, 0xFF)
            Field (MCHT, ByteAcc, NoLock, Preserve)
            {
                Offset (0x1E), 
                T0IS,   16, 
                Offset (0x5E), 
                T1IS,   16, 
                Offset (0xEF), 
                ESCS,   8
            }

            Name (BUF0, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    ,, , TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000D00,         // Range Minimum
                    0x0000FFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0000F300,         // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    ,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0xFEC00000,         // Length
                    ,, _Y0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFED40000,         // Range Minimum
                    0xFED44FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00005000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                If (PM1L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y00._LEN, C0LN)  // _LEN: Length
                    Store (Zero, C0LN)
                }

                If (LEqual (PM1L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y00._RW, C0RW)  // _RW_: Read-Write Status
                    Store (Zero, C0RW)
                }

                If (PM1H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y01._LEN, C4LN)  // _LEN: Length
                    Store (Zero, C4LN)
                }

                If (LEqual (PM1H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y01._RW, C4RW)  // _RW_: Read-Write Status
                    Store (Zero, C4RW)
                }

                If (PM2L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y02._LEN, C8LN)  // _LEN: Length
                    Store (Zero, C8LN)
                }

                If (LEqual (PM2L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y02._RW, C8RW)  // _RW_: Read-Write Status
                    Store (Zero, C8RW)
                }

                If (PM2H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y03._LEN, CCLN)  // _LEN: Length
                    Store (Zero, CCLN)
                }

                If (LEqual (PM2H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y03._RW, CCRW)  // _RW_: Read-Write Status
                    Store (Zero, CCRW)
                }

                If (PM3L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y04._LEN, D0LN)  // _LEN: Length
                    Store (Zero, D0LN)
                }

                If (LEqual (PM3L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y04._RW, D0RW)  // _RW_: Read-Write Status
                    Store (Zero, D0RW)
                }

                If (PM3H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y05._LEN, D4LN)  // _LEN: Length
                    Store (Zero, D4LN)
                }

                If (LEqual (PM3H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y05._RW, D4RW)  // _RW_: Read-Write Status
                    Store (Zero, D4RW)
                }

                If (PM4L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y06._LEN, D8LN)  // _LEN: Length
                    Store (Zero, D8LN)
                }

                If (LEqual (PM4L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y06._RW, D8RW)  // _RW_: Read-Write Status
                    Store (Zero, D8RW)
                }

                If (PM4H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y07._LEN, DCLN)  // _LEN: Length
                    Store (Zero, DCLN)
                }

                If (LEqual (PM4H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y07._RW, DCRW)  // _RW_: Read-Write Status
                    Store (Zero, DCRW)
                }

                If (PM5L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y08._LEN, E0LN)  // _LEN: Length
                    Store (Zero, E0LN)
                }

                If (LEqual (PM5L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y08._RW, E0RW)  // _RW_: Read-Write Status
                    Store (Zero, E0RW)
                }

                If (PM5H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y09._LEN, E4LN)  // _LEN: Length
                    Store (Zero, E4LN)
                }

                If (LEqual (PM5H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y09._RW, E4RW)  // _RW_: Read-Write Status
                    Store (Zero, E4RW)
                }

                If (PM6L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0A._LEN, E8LN)  // _LEN: Length
                    Store (Zero, E8LN)
                }

                If (LEqual (PM6L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0A._RW, E8RW)  // _RW_: Read-Write Status
                    Store (Zero, E8RW)
                }

                If (PM6H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0B._LEN, ECLN)  // _LEN: Length
                    Store (Zero, ECLN)
                }

                If (LEqual (PM6H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0B._RW, ECRW)  // _RW_: Read-Write Status
                    Store (Zero, ECRW)
                }

                If (PM0H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0C._LEN, F0LN)  // _LEN: Length
                    Store (Zero, F0LN)
                }

                If (LEqual (PM0H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0C._RW, F0RW)  // _RW_: Read-Write Status
                    Store (Zero, F0RW)
                }

                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MIN, M1MN)  // _MIN: Minimum Base Address
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MAX, M1MX)  // _MAX: Maximum Base Address
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._LEN, M1LN)  // _LEN: Length
                ShiftLeft (TLUD, 0x14, M1MN)
                Add (Subtract (M1MX, M1MN), One, M1LN)
                Return (BUF0)
            }

            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (LEqual (GPIC, Zero))
                {
                    Return (Package (0x1B)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            Zero, 
                            ^LPC.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            One, 
                            ^LPC.LNKB, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x02, 
                            ^LPC.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x03, 
                            ^LPC.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            Zero, 
                            ^LPC.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            Zero, 
                            ^LPC.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            One, 
                            ^LPC.LNKB, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x02, 
                            ^LPC.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x03, 
                            ^LPC.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            Zero, 
                            ^LPC.LNKE, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            Zero, 
                            ^LPC.LNKE, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            One, 
                            ^LPC.LNKF, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x02, 
                            ^LPC.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x03, 
                            ^LPC.LNKF, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            Zero, 
                            ^LPC.LNKG, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            Zero, 
                            ^LPC.LNKB, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            One, 
                            ^LPC.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            ^LPC.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            ^LPC.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            Zero, 
                            ^LPC.LNKH, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            One, 
                            ^LPC.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            ^LPC.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            ^LPC.LNKE, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            Zero, 
                            ^LPC.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            One, 
                            ^LPC.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x02, 
                            ^LPC.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            ^LPC.LNKA, 
                            Zero
                        }
                    })
                }
                Else
                {
                    Return (Package (0x1B)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            One, 
                            Zero, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x03, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            One, 
                            Zero, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x03, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            Zero, 
                            Zero, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            Zero, 
                            Zero, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            One, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x03, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            Zero, 
                            Zero, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            Zero, 
                            Zero, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            One, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            Zero, 
                            Zero, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            One, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            Zero, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            Zero, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            One, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            Zero, 
                            0x10
                        }
                    })
                }
            }

            Device (PEGP)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x02)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKB, 
                                Zero
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }
                        })
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (SWIT, One)
                    Name (CRTA, One)
                    Name (LCDA, One)
                    Name (TVAA, One)
                    Name (VLDF, One)
                    OperationRegion (VIDS, PCI_Config, Zero, 0xC8)
                    Field (VIDS, DWordAcc, NoLock, Preserve)
                    {
                        VDID,   32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (_PSC, Zero)  // _PSC: Power State Current
                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        Store (Zero, _PSC)
                    }

                    Method (_PS1, 0, NotSerialized)  // _PS1: Power State 1
                    {
                        Store (One, _PSC)
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        Store (0x03, _PSC)
                    }

                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        Store (And (Arg0, 0x03), SWIT)
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        Return (Package (0x03)
                        {
                            0x0110, 
                            0x80000100, 
                            0x80000210
                        })
                    }

                    Device (CRT)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0100)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            Store (CADL, Local0)
                            Store (CSTE, Local1)
                            And (Local0, 0x02, Local0)
                            And (Local1, 0x02, Local1)
                            If (Local0)
                            {
                                Store (One, CRTA)
                            }
                            Else
                            {
                                Store (Zero, CRTA)
                            }

                            If (CRTA)
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            If (CRTA)
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                        }

                        Method (MXMX, 1, NotSerialized)
                        {
                            Return (One)
                        }
                    }

                    Device (LCD)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0110)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            Store (CADL, Local0)
                            Store (CSTE, Local1)
                            And (Local0, One, Local0)
                            And (Local1, One, Local1)
                            If (Local0)
                            {
                                Store (One, LCDA)
                            }
                            Else
                            {
                                Store (Zero, LCDA)
                            }

                            If (LCDA)
                            {
                                If (LEqual (Local1, One))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, One))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            If (LCDA)
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                        }

                        Method (MXMX, 1, NotSerialized)
                        {
                            Return (One)
                        }

                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            Return (Package (0x0C)
                            {
                                0x46, 
                                0x28, 
                                0x0A, 
                                0x14, 
                                0x1E, 
                                0x28, 
                                0x32, 
                                0x3C, 
                                0x46, 
                                0x50, 
                                0x5A, 
                                0x64
                            })
                        }

                        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                        {
                            Divide (Arg0, 0x0A, Local0, Local1)
                            Decrement (Local1)
                            Store (Local1, ^^^^LPC.EC0.BRTS)
                        }

                        Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
                        {
                            Store (^^^^LPC.EC0.BRTS, Local0)
                            Add (Local0, One, Local0)
                            Multiply (Local0, 0x0A, Local0)
                            Store (Local0, P80H)
                            Sleep (0x64)
                            Return (Local0)
                        }
                    }

                    Device (HDV0)
                    {
                        Name (_ADR, 0x80000210)  // _ADR: Address
                        Method (MXMX, 1, NotSerialized)
                        {
                            Return (One)
                        }
                    }

                    Device (TV)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0200)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            Store (CADL, Local0)
                            Store (CSTE, Local1)
                            And (Local0, 0x04, Local0)
                            And (Local1, 0x04, Local1)
                            If (Local0)
                            {
                                Store (One, TVAA)
                            }
                            Else
                            {
                                Store (Zero, TVAA)
                            }

                            If (TVAA)
                            {
                                If (LEqual (Local1, 0x04))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x04))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            If (TVAA)
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                        }
                    }

                    Method (DSSW, 0, NotSerialized)
                    {
                        If (LEqual (SWIT, Zero))
                        {
                            Store (CADL, Local0)
                            Store (CSTE, Local1)
                            If (LGreater (Local1, One))
                            {
                                And (Local0, Local1, VLDF)
                                And (VLDF, 0xFE, VLDF)
                            }

                            If (VLDF)
                            {
                                If (LEqual (Local0, 0x03))
                                {
                                    If (LEqual (Local1, One))
                                    {
                                        STBL (0x04)
                                    }

                                    If (LEqual (Local1, 0x03))
                                    {
                                        STBL (0x02)
                                    }

                                    If (LEqual (Local1, 0x02))
                                    {
                                        STBL (One)
                                    }
                                }

                                If (LEqual (Local0, 0x05))
                                {
                                    If (LEqual (Local1, One))
                                    {
                                        STBL (0x06)
                                    }

                                    If (LEqual (Local1, 0x05))
                                    {
                                        STBL (0x03)
                                    }

                                    If (LEqual (Local1, 0x04))
                                    {
                                        STBL (One)
                                    }
                                }

                                If (LEqual (Local0, 0x07))
                                {
                                    If (LEqual (Local1, One))
                                    {
                                        STBL (0x04)
                                    }

                                    If (LEqual (Local1, 0x03))
                                    {
                                        STBL (0x02)
                                    }

                                    If (LEqual (Local1, 0x02))
                                    {
                                        STBL (0x06)
                                    }

                                    If (LEqual (Local1, 0x05))
                                    {
                                        STBL (0x03)
                                    }

                                    If (LEqual (Local1, 0x04))
                                    {
                                        STBL (One)
                                    }
                                }
                            }
                            Else
                            {
                                Store (One, VLDF)
                                STBL (One)
                            }
                        }
                        Else
                        {
                            If (LEqual (SWIT, One)) {}
                        }
                    }

                    Method (STBL, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, One))
                        {
                            Store (Zero, CRTA)
                            Store (One, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Store (One, CRTA)
                            Store (Zero, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Zero, CRTA)
                            Store (Zero, LCDA)
                            Store (One, TVAA)
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            Store (One, CRTA)
                            Store (One, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x05))
                        {
                            Store (Zero, CRTA)
                            Store (One, LCDA)
                            Store (One, TVAA)
                        }

                        If (LEqual (Arg0, 0x06))
                        {
                            Store (One, CRTA)
                            Store (Zero, LCDA)
                            Store (One, TVAA)
                        }

                        If (LEqual (Arg0, 0x07))
                        {
                            Store (One, CRTA)
                            Store (One, LCDA)
                            Store (One, TVAA)
                        }

                        Notify (VGA, 0x80)
                    }

                    Method (MXMI, 1, NotSerialized)
                    {
                        Return (0x20)
                    }

                    Method (MXMS, 1, NotSerialized)
                    {
                        Return (MXM2)
                    }
                }
            }

            Device (OVGA)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                {
                    Store (And (Arg0, 0x07), DSEN)
                }

                Method (_DOD, 0, Serialized)  // _DOD: Display Output Devices
                {
                    Store (Zero, NDID)
                    If (LNotEqual (DIDL, Zero))
                    {
                        Store (SDDL (DID1), DID1)
                    }

                    If (LNotEqual (DDL2, Zero))
                    {
                        Store (SDDL (DID2), DID2)
                    }

                    If (LNotEqual (DDL3, Zero))
                    {
                        Store (SDDL (DID3), DID3)
                    }

                    If (LNotEqual (DDL4, Zero))
                    {
                        Store (SDDL (DID4), DID4)
                    }

                    If (LNotEqual (DDL5, Zero))
                    {
                        Store (SDDL (DID5), DID5)
                    }

                    If (LEqual (NDID, One))
                    {
                        Name (TMP1, Package (0x01)
                        {
                            Ones
                        })
                        Store (Or (0x00010000, DID1), Index (TMP1, Zero))
                        Return (TMP1)
                    }

                    If (LEqual (NDID, 0x02))
                    {
                        Name (TMP2, Package (0x02)
                        {
                            Ones, 
                            Ones
                        })
                        Store (Or (0x00010000, DID1), Index (TMP2, Zero))
                        Store (Or (0x00010000, DID2), Index (TMP2, One))
                        Return (TMP2)
                    }

                    If (LEqual (NDID, 0x03))
                    {
                        Name (TMP3, Package (0x03)
                        {
                            Ones, 
                            Ones, 
                            Ones
                        })
                        Store (Or (0x00010000, DID1), Index (TMP3, Zero))
                        Store (Or (0x00010000, DID2), Index (TMP3, One))
                        Store (Or (0x00010000, DID3), Index (TMP3, 0x02))
                        Return (TMP3)
                    }

                    If (LEqual (NDID, 0x04))
                    {
                        Name (TMP4, Package (0x04)
                        {
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones
                        })
                        Store (Or (0x00010000, DID1), Index (TMP4, Zero))
                        Store (Or (0x00010000, DID2), Index (TMP4, One))
                        Store (Or (0x00010000, DID3), Index (TMP4, 0x02))
                        Store (Or (0x00010000, DID4), Index (TMP4, 0x03))
                        Return (TMP4)
                    }

                    If (LGreater (NDID, 0x04))
                    {
                        Name (TMP5, Package (0x05)
                        {
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones
                        })
                        Store (Or (0x00010000, DID1), Index (TMP5, Zero))
                        Store (Or (0x00010000, DID2), Index (TMP5, One))
                        Store (Or (0x00010000, DID3), Index (TMP5, 0x02))
                        Store (Or (0x00010000, DID4), Index (TMP5, 0x03))
                        Store (Or (0x00010000, DID5), Index (TMP5, 0x04))
                        Return (TMP5)
                    }

                    Return (Package (0x01)
                    {
                        0x0400
                    })
                }

                Device (DD01)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID1, Zero))
                        {
                            Return (One)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID1))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (CDDS (DID1))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (DID1))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD02)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID2, Zero))
                        {
                            Return (0x02)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID2))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (CDDS (DID2))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (DID2))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD03)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID3, Zero))
                        {
                            Return (0x03)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID3))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (DID3, Zero))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID3))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (DID3))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }

                    Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                    {
                        Return (Package (0x0C)
                        {
                            0x46, 
                            0x28, 
                            0x0A, 
                            0x14, 
                            0x1E, 
                            0x28, 
                            0x32, 
                            0x3C, 
                            0x46, 
                            0x50, 
                            0x5A, 
                            0x64
                        })
                    }

                    Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                    {
                        Divide (Arg0, 0x0A, Local0, Local1)
                        Decrement (Local1)
                        Store (Local1, ^^^LPC.EC0.BRTS)
                    }

                    Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
                    {
                        Store (^^^LPC.EC0.BRTS, Local0)
                        Add (Local0, One, Local0)
                        Multiply (Local0, 0x0A, Local0)
                        Store (Local0, P80H)
                        Sleep (0x64)
                        Return (Local0)
                    }
                }

                Device (DD04)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID4, Zero))
                        {
                            Return (0x04)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID4))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (DID4, Zero))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID4))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (DID4))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD05)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID5, Zero))
                        {
                            Return (0x05)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID5))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (DID5, Zero))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID5))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (DID5))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Method (SDDL, 1, NotSerialized)
                {
                    Increment (NDID)
                    Store (And (Arg0, 0x0F0F), Local0)
                    Or (0x80000000, Local0, Local1)
                    If (LEqual (DIDL, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL2, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL3, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL4, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL5, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL6, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL7, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL8, Local0))
                    {
                        Return (Local1)
                    }

                    Return (Zero)
                }

                Method (CDDS, 1, NotSerialized)
                {
                    If (LEqual (CADL, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL2, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL3, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL4, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL5, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL6, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL7, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL8, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    Return (0x1D)
                }

                Method (NDDS, 1, NotSerialized)
                {
                    If (LEqual (NADL, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL2, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL3, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL4, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL5, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL6, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL7, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL8, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Scope (^^PCI0)
                {
                    OperationRegion (MCHP, PCI_Config, 0x40, 0xC0)
                    Field (MCHP, AnyAcc, NoLock, Preserve)
                    {
                        Offset (0x60), 
                        TASM,   10, 
                        Offset (0x62)
                    }
                }

                OperationRegion (IGDP, PCI_Config, 0x40, 0xC0)
                Field (IGDP, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x12), 
                        ,   1, 
                    GIVD,   1, 
                        ,   2, 
                    GUMA,   3, 
                    Offset (0x14), 
                        ,   4, 
                    GMFN,   1, 
                    Offset (0x18), 
                    Offset (0xA4), 
                    ASLE,   8, 
                    Offset (0xA8), 
                    GSSE,   1, 
                    GSSB,   14, 
                    GSES,   1, 
                    Offset (0xB0), 
                        ,   12, 
                    CDVL,   1, 
                    Offset (0xB2), 
                    Offset (0xB5), 
                    LBPC,   8, 
                    Offset (0xBC), 
                    ASLS,   32
                }

                OperationRegion (IGDM, SystemMemory, ASLB, 0x2000)
                Field (IGDM, AnyAcc, NoLock, Preserve)
                {
                    SIGN,   128, 
                    SIZE,   32, 
                    OVER,   32, 
                    SVER,   256, 
                    VVER,   128, 
                    GVER,   128, 
                    MBOX,   32, 
                    DMOD,   32, 
                    Offset (0x100), 
                    DRDY,   32, 
                    CSTS,   32, 
                    CEVT,   32, 
                    Offset (0x120), 
                    DIDL,   32, 
                    DDL2,   32, 
                    DDL3,   32, 
                    DDL4,   32, 
                    DDL5,   32, 
                    DDL6,   32, 
                    DDL7,   32, 
                    DDL8,   32, 
                    CPDL,   32, 
                    CPL2,   32, 
                    CPL3,   32, 
                    CPL4,   32, 
                    CPL5,   32, 
                    CPL6,   32, 
                    CPL7,   32, 
                    CPL8,   32, 
                    CADL,   32, 
                    CAL2,   32, 
                    CAL3,   32, 
                    CAL4,   32, 
                    CAL5,   32, 
                    CAL6,   32, 
                    CAL7,   32, 
                    CAL8,   32, 
                    NADL,   32, 
                    NDL2,   32, 
                    NDL3,   32, 
                    NDL4,   32, 
                    NDL5,   32, 
                    NDL6,   32, 
                    NDL7,   32, 
                    NDL8,   32, 
                    ASLP,   32, 
                    TIDX,   32, 
                    CHPD,   32, 
                    CLID,   32, 
                    CDCK,   32, 
                    SXSW,   32, 
                    EVTS,   32, 
                    CNOT,   32, 
                    NRDY,   32, 
                    Offset (0x200), 
                    SCIE,   1, 
                    GEFC,   4, 
                    GXFC,   3, 
                    GESF,   8, 
                    Offset (0x204), 
                    PARM,   32, 
                    DSLP,   32, 
                    Offset (0x300), 
                    ARDY,   32, 
                    ASLC,   32, 
                    TCHE,   32, 
                    ALSI,   32, 
                    BCLP,   32, 
                    PFIT,   32, 
                    CBLV,   32, 
                    BCLM,   320, 
                    CPFM,   32, 
                    EPFM,   32, 
                    PLUT,   592, 
                    PFMB,   32, 
                    CCDV,   32, 
                    PCFT,   32, 
                    Offset (0x400), 
                    GVD1,   49152, 
                    PHED,   32, 
                    BDDC,   2048
                }

                Name (DBTB, Package (0x15)
                {
                    Zero, 
                    0x07, 
                    0x38, 
                    0x01C0, 
                    0x0E00, 
                    0x3F, 
                    0x01C7, 
                    0x0E07, 
                    0x01F8, 
                    0x0E38, 
                    0x0FC0, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x7000, 
                    0x7007, 
                    0x7038, 
                    0x71C0, 
                    0x7E00
                })
                Name (CDCT, Package (0x05)
                {
                    Package (0x02)
                    {
                        0xE4, 
                        0x0140
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }, 

                    Package (0x02)
                    {
                        Zero, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }
                })
                Name (SUCC, One)
                Name (NVLD, 0x02)
                Name (CRIT, 0x04)
                Name (NCRT, 0x06)
                Method (GSCI, 0, Serialized)
                {
                    Method (GBDA, 0, Serialized)
                    {
                        If (LEqual (GESF, Zero))
                        {
                            Store (0x0679, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, One))
                        {
                            Store (0x0240, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x04))
                        {
                            And (PARM, 0xEFFF0000, PARM)
                            And (PARM, ShiftLeft (DerefOf (Index (DBTB, IBTT)), 0x10), 
                                PARM)
                            Or (IBTT, PARM, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x05))
                        {
                            Store (IPSC, PARM)
                            Or (PARM, ShiftLeft (IPAT, 0x08), PARM)
                            Add (PARM, 0x0100, PARM)
                            Or (PARM, ShiftLeft (LIDS, 0x10), PARM)
                            Add (PARM, 0x00010000, PARM)
                            Or (PARM, ShiftLeft (IBIA, 0x14), PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x06))
                        {
                            Store (ITVF, PARM)
                            Or (PARM, ShiftLeft (ITVM, 0x04), PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            Store (GIVD, PARM)
                            XOr (PARM, One, PARM)
                            Or (PARM, ShiftLeft (GMFN, One), PARM)
                            Or (PARM, 0x1800, PARM)
                            Or (PARM, ShiftLeft (IDMS, 0x11), PARM)
                            Or (ShiftLeft (DerefOf (Index (DerefOf (Index (CDCT, HVCO)), CDVL
                                )), 0x15), PARM, PARM)
                            Store (One, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0A))
                        {
                            Store (Zero, PARM)
                            If (ISSC)
                            {
                                Or (PARM, 0x03, PARM)
                            }

                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0B))
                        {
                            Store (KSV0, PARM)
                            Store (KSV1, GESF)
                            Return (SUCC)
                        }

                        Store (Zero, GESF)
                        Return (CRIT)
                    }

                    Method (SBCB, 0, Serialized)
                    {
                        If (LEqual (GESF, Zero))
                        {
                            Store (Zero, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, One))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x03))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x04))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x05))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x06))
                        {
                            Store (And (PARM, 0x0F), ITVF)
                            Store (ShiftRight (And (PARM, 0xF0), 0x04), ITVM)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            If (LEqual (PARM, Zero))
                            {
                                Store (CLID, Local0)
                                If (And (0x80000000, Local0))
                                {
                                    And (CLID, 0x0F, CLID)
                                    GLID (CLID)
                                }
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x08))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x09))
                        {
                            And (PARM, 0xFF, IBTT)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0A))
                        {
                            And (PARM, 0xFF, IPSC)
                            If (And (ShiftRight (PARM, 0x08), 0xFF))
                            {
                                And (ShiftRight (PARM, 0x08), 0xFF, IPAT)
                                Decrement (IPAT)
                            }

                            And (ShiftRight (PARM, 0x14), 0x07, IBIA)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0B))
                        {
                            And (ShiftRight (PARM, One), One, IF1E)
                            If (And (PARM, 0x0001E000))
                            {
                                And (ShiftRight (PARM, 0x0D), 0x0F, IDMS)
                            }
                            Else
                            {
                                And (ShiftRight (PARM, 0x11), 0x0F, IDMS)
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x10))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x11))
                        {
                            Store (ShiftLeft (LIDS, 0x08), PARM)
                            Add (PARM, 0x0100, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x12))
                        {
                            If (And (PARM, One))
                            {
                                If (LEqual (ShiftRight (PARM, One), One))
                                {
                                    Store (One, ISSC)
                                }
                                Else
                                {
                                    Store (Zero, GESF)
                                    Return (CRIT)
                                }
                            }
                            Else
                            {
                                Store (Zero, ISSC)
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x13))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x14))
                        {
                            And (PARM, 0x0F, PAVP)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        Store (Zero, GESF)
                        Return (SUCC)
                    }

                    If (LEqual (GEFC, 0x04))
                    {
                        Store (GBDA (), GXFC)
                    }

                    If (LEqual (GEFC, 0x06))
                    {
                        Store (SBCB (), GXFC)
                    }

                    Store (Zero, GEFC)
                    Store (One, SCIS)
                    Store (Zero, GSSE)
                    Store (Zero, SCIE)
                    Return (Zero)
                }

                Method (PDRD, 0, NotSerialized)
                {
                    If (LNot (DRDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (DRDY))
                }

                Method (PSTS, 0, NotSerialized)
                {
                    If (LGreater (CSTS, 0x02))
                    {
                        Sleep (ASLP)
                    }

                    Return (LEqual (CSTS, 0x03))
                }

                Method (GNOT, 2, NotSerialized)
                {
                    If (PDRD ())
                    {
                        Return (One)
                    }

                    Store (Arg0, CEVT)
                    Store (0x03, CSTS)
                    If (LAnd (LEqual (CHPD, Zero), LEqual (Arg1, Zero)))
                    {
                        If (LOr (LGreater (OSYS, 0x07D0), LLessEqual (OSYS, 0x07D6)))
                        {
                            Notify (PCI0, Arg1)
                        }
                        Else
                        {
                            Notify (OVGA, Arg1)
                        }
                    }

                    Notify (OVGA, 0x80)
                    Return (Zero)
                }

                Method (GHDS, 1, NotSerialized)
                {
                    Store (Arg0, TIDX)
                    Return (GNOT (One, Zero))
                }

                Method (GLID, 1, NotSerialized)
                {
                    Store (Arg0, CLID)
                    Return (GNOT (0x02, Zero))
                }

                Method (GDCK, 1, NotSerialized)
                {
                    Store (Arg0, CDCK)
                    Return (GNOT (0x04, Zero))
                }

                Method (PARD, 0, NotSerialized)
                {
                    If (LNot (ARDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (ARDY))
                }

                Method (AINT, 2, NotSerialized)
                {
                    If (LNot (And (TCHE, ShiftLeft (One, Arg0))))
                    {
                        Return (One)
                    }

                    If (PARD ())
                    {
                        Return (One)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        If (CPFM)
                        {
                            And (CPFM, 0x0F, Local0)
                            And (EPFM, 0x0F, Local1)
                            If (LEqual (Local0, One))
                            {
                                If (And (Local1, 0x06))
                                {
                                    Store (0x06, PFIT)
                                }
                                Else
                                {
                                    If (And (Local1, 0x08))
                                    {
                                        Store (0x08, PFIT)
                                    }
                                    Else
                                    {
                                        Store (One, PFIT)
                                    }
                                }
                            }

                            If (LEqual (Local0, 0x06))
                            {
                                If (And (Local1, 0x08))
                                {
                                    Store (0x08, PFIT)
                                }
                                Else
                                {
                                    If (And (Local1, One))
                                    {
                                        Store (One, PFIT)
                                    }
                                    Else
                                    {
                                        Store (0x06, PFIT)
                                    }
                                }
                            }

                            If (LEqual (Local0, 0x08))
                            {
                                If (And (Local1, One))
                                {
                                    Store (One, PFIT)
                                }
                                Else
                                {
                                    If (And (Local1, 0x06))
                                    {
                                        Store (0x06, PFIT)
                                    }
                                    Else
                                    {
                                        Store (0x08, PFIT)
                                    }
                                }
                            }
                        }
                        Else
                        {
                            XOr (PFIT, 0x07, PFIT)
                        }

                        Or (PFIT, 0x80000000, PFIT)
                        Store (0x04, ASLC)
                    }
                    Else
                    {
                        If (LEqual (Arg0, One))
                        {
                            Store (Divide (Multiply (Arg1, 0xFF), 0x64, ), BCLP)
                            Or (BCLP, 0x80000000, BCLP)
                            Store (0x02, ASLC)
                        }
                        Else
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (Arg1, ALSI)
                                Store (One, ASLC)
                            }
                            Else
                            {
                                Return (One)
                            }
                        }
                    }

                    Store (Zero, LBPC)
                    Return (Zero)
                }

                Method (SCIP, 0, NotSerialized)
                {
                    If (LNotEqual (OVER, Zero))
                    {
                        Return (LNot (GSMI))
                    }

                    Return (Zero)
                }
            }

            Device (P32)
            {
                Name (_ADR, 0x001E0000)  // _ADR: Address
            }

            Device (LPC)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                OperationRegion (LPC0, PCI_Config, 0x40, 0xC0)
                Field (LPC0, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x20), 
                    PARC,   8, 
                    PBRC,   8, 
                    PCRC,   8, 
                    PDRC,   8, 
                    Offset (0x28), 
                    PERC,   8, 
                    PFRC,   8, 
                    PGRC,   8, 
                    PHRC,   8, 
                    Offset (0x40), 
                    IOD0,   8, 
                    IOD1,   8, 
                    CMA0,   1, 
                    CMB0,   1, 
                    LP0E,   1, 
                    FDDE,   1, 
                    Offset (0x44), 
                    DIO1,   16, 
                    RIO1,   8, 
                    Offset (0x60), 
                        ,   7, 
                    C4O3,   1
                }

                Device (BAT0)
                {
                    Name (_HID, EisaId ("PNP0C0A"))  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
                    {
                        _SB
                    })
                    Name (PBIF, Package (0x0D)
                    {
                        One, 
                        0x0FA0, 
                        0x0FA0, 
                        One, 
                        0x39D0, 
                        0x0190, 
                        0x78, 
                        0x0108, 
                        0x0EC4, 
                        "Li_Ion 4000mA ", 
                        "1234", 
                        "Lion", 
                        "Acer "
                    })
                    Name (PBST, Package (0x04)
                    {
                        One, 
                        Ones, 
                        Ones, 
                        0x39D0
                    })
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (ECON)
                        {
                            If (^^EC0.BAL1)
                            {
                                Sleep (0x64)
                                Return (0x1F)
                            }
                            Else
                            {
                                Sleep (0x64)
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            Sleep (0x64)
                            Return (0x1F)
                        }
                    }

                    Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
                    {
                        If (ECON)
                        {
                            Sleep (0x64)
                            Store (^^EC0.BDC0, Index (PBIF, One))
                            Sleep (0x64)
                            Store (^^EC0.BFC0, Index (PBIF, 0x02))
                            Sleep (0x64)
                            Store (^^EC0.BDV0, Index (PBIF, 0x04))
                            Sleep (0x64)
                            Store (^^EC0.BDC0, Local2)
                            Divide (Local2, 0x64, Local6, Local2)
                            Multiply (Local2, 0x05, Local3)
                            Store (Local3, Index (PBIF, 0x05))
                            Multiply (Local2, 0x03, Local4)
                            Store (Local4, Index (PBIF, 0x06))
                            Sleep (0x64)
                            If (LGreaterEqual (OSYS, 0x07D6))
                            {
                                ToHexString (^^EC0.BSN0, Local2)
                                Mid (Local2, 0x02, 0x04, Local3)
                                Store (Local3, Index (PBIF, 0x0A))
                                Sleep (0x64)
                            }

                            Store (^^EC0.BATD, Index (PBIF, 0x09))
                            Sleep (0x64)
                            Store (^^EC0.BTMF, Local1)
                            Sleep (0x64)
                            If (LEqual (Local1, One))
                            {
                                Store ("SANYO ", Index (PBIF, 0x0C))
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Store ("SONY ", Index (PBIF, 0x0C))
                                }
                                Else
                                {
                                    If (LEqual (Local1, 0x04))
                                    {
                                        Store ("PANASONIC ", Index (PBIF, 0x0C))
                                    }
                                    Else
                                    {
                                        If (LEqual (Local1, 0x03))
                                        {
                                            Store ("Simplo ", Index (PBIF, 0x0C))
                                        }
                                        Else
                                        {
                                            Store ("COMPAL ", Index (PBIF, 0x0C))
                                        }
                                    }
                                }
                            }
                        }

                        Return (PBIF)
                    }

                    Method (_BST, 0, NotSerialized)  // _BST: Battery Status
                    {
                        If (ECON)
                        {
                            Sleep (0x64)
                            Store (^^EC0.BST0, Local0)
                            And (Local0, 0x07, Local0)
                            Store (Local0, Index (PBST, Zero))
                            Sleep (0x64)
                            Store (^^EC0.GAU0, Local2)
                            Sleep (0x64)
                            Store (^^EC0.BPV0, Local3)
                            Sleep (0x64)
                            Store (^^EC0.BFC0, Local1)
                            Sleep (0x64)
                            If (Local2)
                            {
                                Multiply (Local2, Local1, Local2)
                                Divide (Local2, 0x64, Local6, Local2)
                                If (Local6)
                                {
                                    Increment (Local2)
                                }
                            }

                            Store (^^EC0.BAC0, Local1)
                            If (And (Local1, 0x8000, Local1))
                            {
                                Store (^^EC0.BAC0, Local1)
                                Subtract (0xFFFF, Local1, Local1)
                            }
                            Else
                            {
                                Store (Zero, Local1)
                            }

                            Sleep (0x64)
                            Store (Local1, Index (PBST, One))
                            Store (Local2, Index (PBST, 0x02))
                            Store (Local3, Index (PBST, 0x03))
                        }

                        Return (PBST)
                    }
                }

                Device (AC)
                {
                    Name (_HID, "ACPI0003")  // _HID: Hardware ID
                    Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
                    {
                        _SB
                    })
                    Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
                    {
                        If (ECON)
                        {
                            Store (^^EC0.ADPT, PWRS)
                        }

                        Return (PWRS)
                    }
                }

                Device (PWRB)
                {
                    Name (_HID, EisaId ("PNP0C0C"))  // _HID: Hardware ID
                }

                Device (LID0)
                {
                    Name (_HID, EisaId ("PNP0C0D"))  // _HID: Hardware ID
                    Method (_LID, 0, NotSerialized)  // _LID: Lid Status
                    {
                        Return (LPDL)
                    }
                }

                Device (SLPB)
                {
                    Name (_HID, EisaId ("PNP0C0E"))  // _HID: Hardware ID
                }

                OperationRegion (PRR0, PCI_Config, 0x60, 0x04)
                Field (PRR0, AnyAcc, NoLock, Preserve)
                {
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8
                }

                OperationRegion (PRR1, PCI_Config, 0x68, 0x04)
                Field (PRR1, AnyAcc, NoLock, Preserve)
                {
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8
                }

                OperationRegion (PRR2, PCI_Config, 0x80, 0x02)
                Field (PRR2, AnyAcc, NoLock, Preserve)
                {
                    IODL,   8, 
                    IODH,   8
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRA, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRA, 0x80, PIRA)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRA, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRA, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRA)
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRB, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRB, 0x80, PIRB)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRB, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRB, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRB)
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                    Name (_UID, 0x03)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRC, 0x80, PIRC)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRC, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRC, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRC)
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                    Name (_UID, 0x04)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRD, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRD, 0x80, PIRD)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRD, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRD, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRD)
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                    Name (_UID, 0x05)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRE, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRE, 0x80, PIRE)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRE, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRE, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRE)
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                    Name (_UID, 0x06)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRF, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRF, 0x80, PIRF)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRF, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRF, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRF)
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                    Name (_UID, 0x07)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRG, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRG, 0x80, PIRG)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRG, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRG, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRG)
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                    Name (_UID, 0x08)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRH, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRH, 0x80, PIRH)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRH, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRH, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRH)
                    }
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x004E,             // Range Minimum
                            0x004E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x164E,             // Range Minimum
                            0x164E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B2,             // Range Minimum
                            0x00B2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0063,             // Range Minimum
                            0x0063,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0067,             // Range Minimum
                            0x0067,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0600,             // Range Minimum
                            0x0600,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0610,             // Range Minimum
                            0x0610,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0810,             // Range Minimum
                            0x0810,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0820,             // Range Minimum
                            0x0820,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x0500,             // Range Minimum
                            0x0500,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x0068,             // Range Minimum
                            0x0068,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x006C,             // Range Minimum
                            0x006C,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xF8000000,         // Address Base
                            0x04000000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED1C000,         // Address Base
                            0x00004000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED10000,         // Address Base
                            0x00004000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED18000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED19000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFEC00000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED20000,         // Address Base
                            0x00070000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFEE00000,         // Address Base
                            0x00001000,         // Address Length
                            )
                    })
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x11,               // Length
                            )
                        IO (Decode16,
                            0x0093,             // Range Minimum
                            0x0093,             // Range Maximum
                            0x01,               // Alignment
                            0x0D,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))  // _HID: Hardware ID
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If (LEqual (HPTS, One))
                        {
                            Return (BUF0)
                        }
                        Else
                        {
                            Return (BUF1)
                        }
                    }
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))  // _HID: Hardware ID
                    Name (BUF0, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y0E)
                    })
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LGreaterEqual (OSYS, 0x07D1))
                        {
                            If (LEqual (HPTS, One))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Else
                        {
                            If (HPTS)
                            {
                                Return (0x0B)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If (LEqual (HPTS, One))
                        {
                            CreateDWordField (BUF0, \_SB.PCI0.LPC.HPET._Y0E._BAS, HPT0)  // _BAS: Base Address
                            If (LEqual (HPTA, One))
                            {
                                Store (0xFED01000, HPT0)
                            }

                            If (LEqual (HPTA, 0x02))
                            {
                                Store (0xFED02000, HPT0)
                            }

                            If (LEqual (HPTA, 0x03))
                            {
                                Store (0xFED03000, HPT0)
                            }
                        }

                        Return (BUF0)
                    }
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0024,             // Range Minimum
                            0x0024,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0028,             // Range Minimum
                            0x0028,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002C,             // Range Minimum
                            0x002C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0030,             // Range Minimum
                            0x0030,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0034,             // Range Minimum
                            0x0034,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0038,             // Range Minimum
                            0x0038,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x003C,             // Range Minimum
                            0x003C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A4,             // Range Minimum
                            0x00A4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A8,             // Range Minimum
                            0x00A8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00AC,             // Range Minimum
                            0x00AC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B4,             // Range Minimum
                            0x00B4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00BC,             // Range Minimum
                            0x00BC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (FPU)
                {
                    Name (_HID, EisaId ("PNP0C04"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100"))  // _HID: Hardware ID
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If (HPTS)
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
                }

                Device (FWHD)
                {
                    Name (_HID, EisaId ("INT0800"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        Memory32Fixed (ReadOnly,
                            0xFFF00000,         // Address Base
                            0x00100000,         // Address Length
                            )
                    })
                }

                Device (KBC0)
                {
                    Name (_HID, EisaId ("PNP0303"))  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LGreaterEqual (OSYS, 0x07D6))
                        {
                            If (LEqual (KBTP, 0x4A))
                            {
                                Return (Zero)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {1}
                    })
                }

                Device (KBCJ)
                {
                    Name (_HID, EisaId ("PNP0320"))  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LGreaterEqual (OSYS, 0x07D6))
                        {
                            If (LEqual (KBTP, 0x4A))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {1}
                    })
                }

                Device (MSE0)
                {
                    Name (_HID, EisaId ("PNP0F13"))  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (And (TPAD, One), One))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (MSS0)
                {
                    Name (_HID, EisaId ("SYN1B16"))  // _HID: Hardware ID
                    Name (_CID, Package (0x03)  // _CID: Compatible ID
                    {
                        EisaId ("SYN1B00"), 
                        EisaId ("SYN0002"), 
                        EisaId ("PNP0F13")
                    })
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (And (TPAD, One), One))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Name (_GPE, 0x1C)  // _GPE: General Purpose Events
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (BFFR, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0062,             // Range Minimum
                                0x0062,             // Range Maximum
                                0x00,               // Alignment
                                0x01,               // Length
                                )
                            IO (Decode16,
                                0x0066,             // Range Minimum
                                0x0066,             // Range Maximum
                                0x00,               // Alignment
                                0x01,               // Length
                                )
                        })
                        Return (BFFR)
                    }

                    Name (_ADR, 0x00020000)  // _ADR: Address
                    OperationRegion (HDCS, PCI_Config, Zero, One)
                    Field (HDCS, ByteAcc, NoLock, Preserve)
                    {
                        OBV,    8
                    }

                    OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
                    Field (ERAM, ByteAcc, Lock, Preserve)
                    {
                            ,   1, 
                        LCDS,   1, 
                        DOCK,   1, 
                        LANC,   1, 
                        Offset (0x08), 
                        BATM,   16, 
                        Offset (0x19), 
                        BATD,   56, 
                        Offset (0x60), 
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SMDR,   32, 
                        BCNT,   8, 
                        SMAA,   8, 
                        SMD0,   8, 
                        SMD1,   8, 
                        Offset (0x90), 
                        Offset (0x91), 
                        Offset (0x92), 
                        Offset (0x93), 
                        Offset (0x94), 
                        ERIB,   16, 
                        ERBD,   8, 
                        Offset (0x98), 
                        Offset (0x99), 
                        OSIF,   1, 
                        Offset (0x9A), 
                        BAL1,   1, 
                        BAL2,   1, 
                        BAL3,   1, 
                        BAL4,   1, 
                        BCL1,   1, 
                        BCL2,   1, 
                        BCL3,   1, 
                        BCL4,   1, 
                        BPU1,   1, 
                        BPU2,   1, 
                        BPU3,   1, 
                        BPU4,   1, 
                        BOS1,   1, 
                        BOS2,   1, 
                        BOS3,   1, 
                        BOS4,   1, 
                        PHDD,   1, 
                        IFDD,   1, 
                        IODD,   1, 
                        SHDD,   1, 
                        LS20,   1, 
                        EFDD,   1, 
                        ECRT,   1, 
                        Offset (0x9D), 
                        SBTN,   1, 
                        VIDO,   1, 
                        VOLD,   1, 
                        VOLU,   1, 
                        MUTE,   1, 
                        CONT,   1, 
                        BRGT,   1, 
                        HBTN,   1, 
                        S4SE,   1, 
                        SKEY,   1, 
                        BKEY,   1, 
                        TKEY,   1, 
                        FKEY,   1, 
                        DVDM,   1, 
                        DIGM,   1, 
                        CDLK,   1, 
                            ,   1, 
                        LIDO,   1, 
                        PMEE,   1, 
                        PBET,   1, 
                        RIIN,   1, 
                        BTWK,   1, 
                        DKIN,   1, 
                        Offset (0xA0), 
                            ,   6, 
                        SWTH,   1, 
                        HWTH,   1, 
                        DKT0,   1, 
                        DKT1,   1, 
                            ,   2, 
                        OSUD,   1, 
                        OSDK,   1, 
                        OSSU,   1, 
                        DKCG,   1, 
                        ODTS,   8, 
                        S1LD,   1, 
                        S3LD,   1, 
                        VGAQ,   1, 
                        PCMQ,   1, 
                        PCMR,   1, 
                        ADPT,   1, 
                        SYS6,   1, 
                        SYS7,   1, 
                        PWAK,   1, 
                        MWAK,   1, 
                        LWAK,   1, 
                        RWAK,   1, 
                            ,   2, 
                        KWAK,   1, 
                        MSWK,   1, 
                        CCAC,   1, 
                        AOAC,   1, 
                        BLAC,   1, 
                        PSRC,   1, 
                        BOAC,   1, 
                        LCAC,   1, 
                        AAAC,   1, 
                        ACAC,   1, 
                        PCEC,   8, 
                        THON,   8, 
                        THSD,   8, 
                        THEM,   8, 
                        TCON,   8, 
                        THRS,   8, 
                        THSE,   8, 
                        FSSN,   4, 
                        FANU,   4, 
                        PTVL,   3, 
                            ,   3, 
                        TTSR,   1, 
                        TTHR,   1, 
                        TSTH,   1, 
                        TSBC,   1, 
                        TSBF,   1, 
                        TSPL,   1, 
                        TSBT,   1, 
                            ,   2, 
                        THTA,   1, 
                        CTMP,   8, 
                        LTMP,   8, 
                        Offset (0xB3), 
                        Offset (0xB4), 
                        SKTC,   8, 
                        SKTA,   8, 
                        NBTP,   8, 
                        Offset (0xB8), 
                        BTPV,   8, 
                        BRTS,   8, 
                        CTRS,   8, 
                        WLAT,   1, 
                        BTAT,   1, 
                        WLEX,   1, 
                        BTEX,   1, 
                        KLSW,   1, 
                        WLOK,   1, 
                        Offset (0xBC), 
                        PJID,   8, 
                        CPUN,   8, 
                        THFN,   8, 
                        MLED,   1, 
                        SCHG,   1, 
                        SCCF,   1, 
                        SCPF,   1, 
                        ACIS,   1, 
                        Offset (0xC0), 
                            ,   4, 
                        BTMF,   3, 
                        BTY0,   1, 
                        BST0,   8, 
                        BRC0,   16, 
                        BSN0,   16, 
                        BPV0,   16, 
                        BDV0,   16, 
                        BDC0,   16, 
                        BFC0,   16, 
                        GAU0,   8, 
                        BSCY,   8, 
                        BSCU,   16, 
                        BAC0,   16, 
                        BTW0,   8, 
                        BATV,   8, 
                        BPTC,   8, 
                        BTTC,   8, 
                        BTMA,   16, 
                        BTSC,   8, 
                        BCIX,   8, 
                        CCBA,   8, 
                        CBOT,   8, 
                        BTSS,   16, 
                        OVCC,   8, 
                        CCFC,   8, 
                        BADC,   8, 
                        BSC1,   16, 
                        BSC2,   16, 
                        BSC3,   16, 
                        BSC4,   16, 
                        BDME,   16, 
                        Offset (0xEE), 
                        Offset (0xEF), 
                        Offset (0xF0), 
                        BTS1,   8, 
                        BTS2,   8, 
                        BSCS,   16, 
                        BDAD,   16, 
                        BACV,   16, 
                        BDFC,   16
                    }

                    OperationRegion (CCLK, SystemIO, 0x0410, 0x04)
                    Field (CCLK, DWordAcc, NoLock, Preserve)
                    {
                            ,   1, 
                        DUTY,   3, 
                        THEN,   1, 
                        Offset (0x01), 
                        FTT,    1, 
                            ,   8, 
                        TSTS,   1
                    }

                    Mutex (FAMX, 0x00)
                    Method (FANG, 1, NotSerialized)
                    {
                        Acquire (FAMX, 0xFFFF)
                        Store (Arg0, ERIB)
                        Store (ERBD, Local0)
                        Release (FAMX)
                        Return (Local0)
                    }

                    Method (FANW, 2, NotSerialized)
                    {
                        Acquire (FAMX, 0xFFFF)
                        Store (Arg0, ERIB)
                        Store (Arg1, ERBD)
                        Release (FAMX)
                        Return (Arg1)
                    }

                    Method (TUVR, 1, NotSerialized)
                    {
                        Return (0x03)
                    }

                    Method (THRO, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            Return (THEN)
                        }
                        Else
                        {
                            If (LEqual (Arg0, One))
                            {
                                Return (DUTY)
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x02))
                                {
                                    Return (TTHR)
                                }
                                Else
                                {
                                    Return (0xFF)
                                }
                            }
                        }
                    }

                    Method (CLCK, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            Store (Zero, THEN)
                        }
                        Else
                        {
                            Store (Arg0, DUTY)
                            Store (One, THEN)
                        }

                        Return (THEN)
                    }

                    Method (PCLK, 0, NotSerialized)
                    {
                        Store (PTVL, Local0)
                        If (LEqual (Local0, Zero))
                        {
                            Store (Zero, THEN)
                        }
                        Else
                        {
                            Not (Local0, Local0)
                            Add (Local0, One, Local0)
                            And (Local0, 0x07, Local0)
                            Store (Local0, DUTY)
                            If (LEqual (Local0, Zero))
                            {
                                Store (Zero, THEN)
                            }
                            Else
                            {
                                Store (One, THEN)
                            }
                        }
                    }

                    Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, ECON)
                            If (LEqual (LIDO, ^^^OVGA.CLID))
                            {
                                If (LEqual (LIDO, Zero))
                                {
                                    ^^^OVGA.GLID (One)
                                }
                                Else
                                {
                                    ^^^OVGA.GLID (Zero)
                                }
                            }
                            Else
                            {
                                If (LNot (^^^OVGA.GLID (LIDO)))
                                {
                                    Store (LIDO, LIDS)
                                    Notify (LID0, 0x80)
                                }
                            }
                        }
                    }

                    Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (LGreaterEqual (OSYS, 0x07D6))
                        {
                            If (LEqual (OBV, 0xFF))
                            {
                                Notify (^^^PEGP.VGA.LCD, 0x87)
                            }
                            Else
                            {
                                Notify (^^^OVGA.DD03, 0x87)
                            }
                        }
                        Else
                        {
                            If (LEqual (^^^WMID.BAEF, One))
                            {
                                Store (BRTS, Local1)
                                Store (^^^WMID.LBL0, Local2)
                                Add (Local2, Local1, Local2)
                                Store (Local2, ^^^WMID.NTDC)
                                Notify (WMID, 0x80)
                            }
                        }
                    }

                    Method (_Q12, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (LGreaterEqual (OSYS, 0x07D6))
                        {
                            If (LEqual (OBV, 0xFF))
                            {
                                Notify (^^^PEGP.VGA.LCD, 0x86)
                            }
                            Else
                            {
                                Notify (^^^OVGA.DD03, 0x86)
                            }
                        }
                        Else
                        {
                            If (LEqual (^^^WMID.BAEF, One))
                            {
                                Store (BRTS, Local1)
                                Store (^^^WMID.LBL0, Local2)
                                Add (Local2, Local1, Local2)
                                Store (Local2, ^^^WMID.NTDC)
                                Notify (WMID, 0x80)
                            }
                        }
                    }

                    Method (_Q1C, 0, NotSerialized)  // _Qxx: EC Query
                    {
                    }

                    Method (_Q1D, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        PCLK ()
                    }

                    Method (_Q22, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Notify (BAT0, 0x80)
                    }

                    Method (_Q25, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Notify (BAT0, 0x81)
                        Notify (BAT0, 0x80)
                    }

                    Method (_Q2A, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        OSMI (0x92)
                    }

                    Method (_Q2B, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        OSMI (0x93)
                    }

                    Method (_Q34, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (LEqual (^^^WMID.BAEF, One))
                        {
                            Store (BTAT, Local1)
                            Store (^^^WMID.BLTD, Local2)
                            Add (Local2, Local1, Local2)
                            Store (Local2, ^^^WMID.NTDC)
                            Notify (WMID, 0x80)
                        }
                    }

                    Method (_Q37, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Notify (AC, Zero)
                        Sleep (0x03F0)
                        Notify (BAT0, 0x80)
                        Notify (\_PR.CPU0, 0x80)
                        Notify (\_PR.CPU1, 0x80)
                        Store (Zero, ^^^EXP5.J380.D3EF)
                    }

                    Method (_Q38, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Notify (AC, One)
                        Sleep (0x03F0)
                        Notify (BAT0, 0x80)
                        Notify (\_PR.CPU0, 0x80)
                        Notify (\_PR.CPU1, 0x80)
                        Store (One, ^^^EXP5.J380.D3EF)
                    }

                    Method (_Q60, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (LEqual (^^^WMID.BAEF, One))
                        {
                            Store (WLAT, Local1)
                            Store (^^^WMID.WLSD, Local2)
                            Add (Local2, Local1, Local2)
                            Store (Local2, ^^^WMID.NTDC)
                            Notify (WMID, 0x80)
                        }
                    }

                    Method (_Q4F, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (LEqual (^^^WMID.BAEF, One))
                        {
                            Store (One, Local1)
                            If (LEqual (LANC, One))
                            {
                                Store (Zero, Local1)
                            }

                            Store (^^^WMID.LANI, Local2)
                            Add (Local2, Local1, Local2)
                            Store (Local2, ^^^WMID.NTDC)
                            Notify (WMID, 0x80)
                        }
                    }

                    Method (_Q50, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (LEqual (^^^WMID.BAEF, One))
                        {
                            Store (Zero, Local1)
                            If (LEqual (LCDS, One))
                            {
                                Store (One, Local1)
                            }

                            Store (^^^WMID.LDOF, Local2)
                            Add (Local2, Local1, Local2)
                            Store (Local2, ^^^WMID.NTDC)
                            Notify (WMID, 0x80)
                        }
                    }
                }
            }

            Device (UHC0)
            {
                Name (_ADR, 0x001D0000)  // _ADR: Address
                Device (HUB0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Name (_EJD, "\\_SB.PCI0.EXP1.PXS1")  // _EJD: Ejection Dependent Device
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        Store (One, URES)
                    }
                    Else
                    {
                        Store (Zero, URES)
                    }
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
                {
                    Return (0x02)
                }
            }

            Device (UHC1)
            {
                Name (_ADR, 0x001D0001)  // _ADR: Address
                Device (HUB1)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x04, 
                    0x03
                })
                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        Store (One, URES)
                    }
                    Else
                    {
                        Store (Zero, URES)
                    }
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
                {
                    Return (0x02)
                }
            }

            Device (UHC2)
            {
                Name (_ADR, 0x001D0002)  // _ADR: Address
                Device (HUB2)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0C, 
                    0x03
                })
                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        Store (0x02, URES)
                    }
                    Else
                    {
                        Store (Zero, URES)
                    }
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
                {
                    Return (0x02)
                }
            }

            Device (UHCR)
            {
                Name (_ADR, 0x001D0003)  // _ADR: Address
                Device (HUBR)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }
                }
            }

            Device (EHC1)
            {
                OperationRegion (U7CS, PCI_Config, 0x54, 0x04)
                Field (U7CS, DWordAcc, NoLock, Preserve)
                {
                        ,   15, 
                    PMES,   1
                }

                Name (_ADR, 0x001D0007)  // _ADR: Address
                Device (HUB7)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Name (_EJD, "\\_SB.PCI0.EXP1.PXS1")  // _EJD: Ejection Dependent Device
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                    }

                    Device (PRT5)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                    }

                    Device (PRT6)
                    {
                        Name (_ADR, 0x06)  // _ADR: Address
                    }

                    Device (PRT7)
                    {
                        Name (_ADR, 0x07)  // _ADR: Address
                    }

                    Device (PRT8)
                    {
                        Name (_ADR, 0x08)  // _ADR: Address
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0D, 
                    0x03
                })
            }

            Device (UHC3)
            {
                Name (_ADR, 0x001A0000)  // _ADR: Address
                Device (HUB3)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }
                }
            }

            Device (UHC4)
            {
                Name (_ADR, 0x001A0001)  // _ADR: Address
                Device (HUB4)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }
                }
            }

            Device (EHC2)
            {
                Name (_ADR, 0x001A0007)  // _ADR: Address
                Device (HUB8)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }
                    }
                }
            }

            Device (EXP1)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0xE0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    VDID,   16, 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    LSCX,   1, 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXS1)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (P1FG, PCI_Config, Zero, 0x08)
                    Field (P1FG, DWordAcc, NoLock, Preserve)
                    {
                        P1ID,   32
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (One)
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (P1ID, Ones))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Name (_EJD, "\\_SB.PCI0.EHC1.HUB7.PRT2")  // _EJD: Ejection Dependent Device
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC.LNKD, 
                                Zero
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x13
                            }
                        })
                    }
                }
            }

            Device (EXP2)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC.LNKA, 
                                Zero
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x10
                            }
                        })
                    }
                }

                OperationRegion (PXCS, PCI_Config, Zero, 0xE0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    VDID,   16, 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    LSCX,   1, 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }
            }

            Device (EXP3)
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC.LNKB, 
                                Zero
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x11
                            }
                        })
                    }
                }

                OperationRegion (PXCS, PCI_Config, Zero, 0xE0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    VDID,   16, 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    LSCX,   1, 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }
            }

            Device (EXP4)
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC.LNKC, 
                                Zero
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x12
                            }
                        })
                    }
                }

                OperationRegion (PXCS, PCI_Config, Zero, 0xE0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    VDID,   16, 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    LSCX,   1, 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }
            }

            Device (EXP5)
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC.LNKD, 
                                Zero
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x13
                            }
                        })
                    }
                }

                OperationRegion (PXCR, PCI_Config, Zero, 0xFF)
                Field (PXCR, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x5A), 
                        ,   3, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                        ,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEN,   1, 
                    PMEN,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (J380)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0xFF)
                    Field (PCFG, ByteAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SSID,   32, 
                        Offset (0xAC), 
                            ,   6, 
                        D3EF,   1, 
                        Offset (0xAD), 
                        Offset (0xB2), 
                        LAT0,   8, 
                        Offset (0xCF), 
                        ATRB,   8, 
                        Offset (0xD3), 
                        PMC0,   8
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LNotEqual (DVID, Ones))
                        {
                            Return (0x0A)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                Device (J381)
                {
                    Name (_ADR, One)  // _ADR: Address
                }

                Device (J382)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                }

                Device (J383)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                }

                Device (J384)
                {
                    Name (_ADR, 0x04)  // _ADR: Address
                }
            }

            Device (EXP6)
            {
                Name (_ADR, 0x001C0005)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC.LNKA, 
                                Zero
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x10
                            }
                        })
                    }
                }
            }

            Device (SAT0)
            {
                Name (_ADR, 0x001F0002)  // _ADR: Address
                OperationRegion (SACS, PCI_Config, 0x40, 0xC0)
                Field (SACS, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                    SECT,   16, 
                    PSIT,   4, 
                    SSIT,   4, 
                    Offset (0x08), 
                    SYNC,   4, 
                    Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                    Offset (0x0B), 
                    SDT2,   2, 
                        ,   2, 
                    SDT3,   2, 
                    Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    ICR4,   4, 
                    ICR5,   4, 
                    Offset (0x50), 
                    MAPV,   2
                }

                Device (PRID)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, Serialized)  // _GTM: Get Timing Mode
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            Name (PBUF, Buffer (0x14)
                            {
                                /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0010 */   0x00, 0x00, 0x00, 0x00
                            })
                            CreateDWordField (PBUF, Zero, PIO0)
                            CreateDWordField (PBUF, 0x04, DMA0)
                            CreateDWordField (PBUF, 0x08, PIO1)
                            CreateDWordField (PBUF, 0x0C, DMA1)
                            CreateDWordField (PBUF, 0x10, FLAG)
                            Store (GETP (PRIT), PIO0)
                            Store (GDMA (And (SYNC, One), And (ICR3, One), 
                                And (ICR0, One), SDT0, And (ICR1, One)), DMA0)
                            If (LEqual (DMA0, Ones))
                            {
                                Store (PIO0, DMA0)
                            }

                            If (And (PRIT, 0x4000))
                            {
                                If (LEqual (And (PRIT, 0x90), 0x80))
                                {
                                    Store (0x0384, PIO1)
                                }
                                Else
                                {
                                    Store (GETT (PSIT), PIO1)
                                }
                            }
                            Else
                            {
                                Store (Ones, PIO1)
                            }

                            Store (GDMA (And (SYNC, 0x02), And (ICR3, 0x02), 
                                And (ICR0, 0x02), SDT1, And (ICR1, 0x02)), DMA1)
                            If (LEqual (DMA1, Ones))
                            {
                                Store (PIO1, DMA1)
                            }

                            Store (GETF (And (SYNC, One), And (SYNC, 0x02), 
                                PRIT), FLAG)
                            Return (PBUF)
                        }
                        Return (PBUF)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            CreateDWordField (Arg0, Zero, PIO0)
                            CreateDWordField (Arg0, 0x04, DMA0)
                            CreateDWordField (Arg0, 0x08, PIO1)
                            CreateDWordField (Arg0, 0x0C, DMA1)
                            CreateDWordField (Arg0, 0x10, FLAG)
                            If (LEqual (SizeOf (Arg1), 0x0200))
                            {
                                And (PRIT, 0x40F0, PRIT)
                                And (SYNC, 0x0E, SYNC)
                                Store (Zero, SDT0)
                                And (ICR0, 0x0E, ICR0)
                                And (ICR1, 0x0E, ICR1)
                                And (ICR3, 0x0E, ICR3)
                                And (ICR5, 0x0E, ICR5)
                                CreateWordField (Arg1, 0x62, W490)
                                CreateWordField (Arg1, 0x6A, W530)
                                CreateWordField (Arg1, 0x80, W640)
                                Or (PRIT, 0x8004, PRIT)
                                If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                                {
                                    Or (PRIT, 0x02, PRIT)
                                }

                                Or (PRIT, SETP (PIO0, W530, W640), PRIT)
                                If (And (FLAG, One))
                                {
                                    Or (SYNC, One, SYNC)
                                    Store (SDMA (DMA0), SDT0)
                                    If (LLess (DMA0, 0x1E))
                                    {
                                        Or (ICR3, One, ICR3)
                                    }

                                    If (LLess (DMA0, 0x3C))
                                    {
                                        Or (ICR0, One, ICR0)
                                    }

                                    Or (ICR1, One, ICR1)
                                }
                            }

                            If (LEqual (SizeOf (Arg2), 0x0200))
                            {
                                And (PRIT, 0x3F0F, PRIT)
                                Store (Zero, PSIT)
                                And (SYNC, 0x0D, SYNC)
                                Store (Zero, SDT1)
                                And (ICR0, 0x0D, ICR0)
                                And (ICR1, 0x0D, ICR1)
                                And (ICR3, 0x0D, ICR3)
                                And (ICR5, 0x0D, ICR5)
                                CreateWordField (Arg2, 0x62, W491)
                                CreateWordField (Arg2, 0x6A, W531)
				CreateWordField (Arg2, 0x80, W641)
                                Or (PRIT, 0x8040, PRIT)
                                If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                                {
                                    Or (PRIT, 0x20, PRIT)
                                }

                                If (And (FLAG, 0x10))
                                {
                                    Or (PRIT, 0x4000, PRIT)
                                    If (LGreater (PIO1, 0xF0))
                                    {
                                        Or (PRIT, 0x80, PRIT)
                                    }
                                    Else
                                    {
                                        Or (PRIT, 0x10, PRIT)
                                        Store (SETT (PIO1, W531, W641), PSIT)
                                    }
                                }

                                If (And (FLAG, 0x04))
                                {
                                    Or (SYNC, 0x02, SYNC)
                                    Store (SDMA (DMA1), SDT1)
                                    If (LLess (DMA1, 0x1E))
                                    {
                                        Or (ICR3, 0x02, ICR3)
                                    }

                                    If (LLess (DMA1, 0x3C))
                                    {
                                        Or (ICR0, 0x02, ICR0)
                                    }

                                    Or (ICR1, 0x02, ICR1)
                                }
                            }
                        }
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, Serialized)  // _GTF: Get Task File
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (PIB0, Buffer (0x0E)
                                {
                                    /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03,
                                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                })
                                CreateByteField (PIB0, One, PMD0)
                                CreateByteField (PIB0, 0x08, DMD0)
                                If (And (PRIT, 0x02))
                                {
                                    If (LEqual (And (PRIT, 0x09), 0x08))
                                    {
                                        Store (0x08, PMD0)
                                    }
                                    Else
                                    {
                                        Store (0x0A, PMD0)
                                        ShiftRight (And (PRIT, 0x0300), 0x08, Local0)
                                        ShiftRight (And (PRIT, 0x3000), 0x0C, Local1)
                                        Add (Local0, Local1, Local2)
                                        If (LEqual (0x03, Local2))
                                        {
                                            Store (0x0B, PMD0)
                                        }

                                        If (LEqual (0x05, Local2))
                                        {
                                            Store (0x0C, PMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD0)
                                }

                                If (And (SYNC, One))
                                {
                                    Store (Or (SDT0, 0x40), DMD0)
                                    If (And (ICR1, One))
                                    {
                                        If (And (ICR0, One))
                                        {
                                            Add (DMD0, 0x02, DMD0)
                                        }

                                        If (And (ICR3, One))
                                        {
                                            Store (0x45, DMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                                }

                                Return (PIB0)
                            }
                           Return (PIB0)
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, Serialized)  // _GTF: Get Task File
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (PIB1, Buffer (0x0E)
                                {
                                    /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03,
                                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                })
                                CreateByteField (PIB1, One, PMD1)
                                CreateByteField (PIB1, 0x08, DMD1)
                                If (And (PRIT, 0x20))
                                {
                                    If (LEqual (And (PRIT, 0x90), 0x80))
                                    {
                                        Store (0x08, PMD1)
                                    }
                                    Else
                                    {
                                        Add (And (PSIT, 0x03), ShiftRight (And (PSIT, 0x0C), 
                                            0x02), Local0)
                                        If (LEqual (0x05, Local0))
                                        {
                                            Store (0x0C, PMD1)
                                        }
                                        Else
                                        {
                                            If (LEqual (0x03, Local0))
                                            {
                                                Store (0x0B, PMD1)
                                            }
                                            Else
                                            {
                                                Store (0x0A, PMD1)
                                            }
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD1)
                                }

                                If (And (SYNC, 0x02))
                                {
                                    Store (Or (SDT1, 0x40), DMD1)
                                    If (And (ICR1, 0x02))
                                    {
                                        If (And (ICR0, 0x02))
                                        {
                                            Add (DMD1, 0x02, DMD1)
                                        }

                                        If (And (ICR3, 0x02))
                                        {
                                            Store (0x45, DMD1)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                                }

                                Return (PIB1)
                            }
                            Return (PIB1)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, Serialized)  // _GTM: Get Timing Mode
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            Name (SBUF, Buffer (0x14)
                            {
                                /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0010 */   0x00, 0x00, 0x00, 0x00
                            })
                            CreateDWordField (SBUF, Zero, PIO0)
                            CreateDWordField (SBUF, 0x04, DMA0)
                            CreateDWordField (SBUF, 0x08, PIO1)
                            CreateDWordField (SBUF, 0x0C, DMA1)
                            CreateDWordField (SBUF, 0x10, FLAG)
                            Store (GETP (SECT), PIO0)
                            Store (GDMA (And (SYNC, 0x04), And (ICR3, 0x04), 
                                And (ICR0, 0x04), SDT2, And (ICR1, 0x04)), DMA0)
                            If (LEqual (DMA0, Ones))
                            {
                                Store (PIO0, DMA0)
                            }

                            If (And (SECT, 0x4000))
                            {
                                If (LEqual (And (SECT, 0x90), 0x80))
                                {
                                    Store (0x0384, PIO1)
                                }
                                Else
                                {
                                    Store (GETT (SSIT), PIO1)
                                }
                            }
                            Else
                            {
                                Store (Ones, PIO1)
                            }

                            Store (GDMA (And (SYNC, 0x08), And (ICR3, 0x08), 
                                And (ICR0, 0x08), SDT3, And (ICR1, 0x08)), DMA1)
                            If (LEqual (DMA1, Ones))
                            {
                                Store (PIO1, DMA1)
                            }

                            Store (GETF (And (SYNC, 0x04), And (SYNC, 0x08), 
                                SECT), FLAG)
                            Return (SBUF)
                        }
                        Return (SBUF)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            CreateDWordField (Arg0, Zero, PIO0)
                            CreateDWordField (Arg0, 0x04, DMA0)
                            CreateDWordField (Arg0, 0x08, PIO1)
                            CreateDWordField (Arg0, 0x0C, DMA1)
                            CreateDWordField (Arg0, 0x10, FLAG)
                            If (LEqual (SizeOf (Arg1), 0x0200))
                            {
                                And (SECT, 0x40F0, SECT)
                                And (SYNC, 0x0B, SYNC)
                                Store (Zero, SDT2)
                                And (ICR0, 0x0B, ICR0)
                                And (ICR1, 0x0B, ICR1)
                                And (ICR3, 0x0B, ICR3)
                                And (ICR5, 0x0B, ICR5)
                                CreateWordField (Arg1, 0x62, W490)
                                CreateWordField (Arg1, 0x6A, W530)
                                CreateWordField (Arg1, 0x80, W640)
                                Or (SECT, 0x8004, SECT)
                                If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                                {
                                    Or (SECT, 0x02, SECT)
                                }

                                Or (SECT, SETP (PIO0, W530, W640), SECT)
                                If (And (FLAG, One))
                                {
                                    Or (SYNC, 0x04, SYNC)
                                    Store (SDMA (DMA0), SDT2)
                                    If (LLess (DMA0, 0x1E))
                                    {
                                        Or (ICR3, 0x04, ICR3)
                                    }

                                    If (LLess (DMA0, 0x3C))
                                    {
                                        Or (ICR0, 0x04, ICR0)
                                    }

                                    Or (ICR1, 0x04, ICR1)
                                }
                            }

                            If (LEqual (SizeOf (Arg2), 0x0200))
                            {
                                And (SECT, 0x3F0F, SECT)
                                Store (Zero, SSIT)
                                And (SYNC, 0x07, SYNC)
                                Store (Zero, SDT3)
                                And (ICR0, 0x07, ICR0)
                                And (ICR1, 0x07, ICR1)
                                And (ICR3, 0x07, ICR3)
                                And (ICR5, 0x07, ICR5)
                                CreateWordField (Arg2, 0x62, W491)
                                CreateWordField (Arg2, 0x6A, W531)
                                CreateWordField (Arg2, 0x80, W641)
                                Or (SECT, 0x8040, SECT)
                                If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                                {
                                    Or (SECT, 0x20, SECT)
                                }

                                If (And (FLAG, 0x10))
                                {
                                    Or (SECT, 0x4000, SECT)
                                    If (LGreater (PIO1, 0xF0))
                                    {
                                        Or (SECT, 0x80, SECT)
                                    }
                                    Else
                                    {
                                        Or (SECT, 0x10, SECT)
                                        Store (SETT (PIO1, W531, W641), SSIT)
                                    }
                                }

                                If (And (FLAG, 0x04))
                                {
                                    Or (SYNC, 0x08, SYNC)
                                    Store (SDMA (DMA1), SDT3)
                                    If (LLess (DMA1, 0x1E))
                                    {
                                        Or (ICR3, 0x08, ICR3)
                                    }

                                    If (LLess (DMA1, 0x3C))
                                    {
                                        Or (ICR0, 0x08, ICR0)
                                    }

                                    Or (ICR1, 0x08, ICR1)
                                }
                            }
                        }
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, Serialized)  // _GTF: Get Task File
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (SIB0, Buffer (0x0E)
                                {
                                    /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03,
                                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                })
                                CreateByteField (SIB0, One, PMD0)
                                CreateByteField (SIB0, 0x08, DMD0)
                                If (And (SECT, 0x02))
                                {
                                    If (LEqual (And (SECT, 0x09), 0x08))
                                    {
                                        Store (0x08, PMD0)
                                    }
                                    Else
                                    {
                                        Store (0x0A, PMD0)
                                        ShiftRight (And (SECT, 0x0300), 0x08, Local0)
                                        ShiftRight (And (SECT, 0x3000), 0x0C, Local1)
                                        Add (Local0, Local1, Local2)
                                        If (LEqual (0x03, Local2))
                                        {
                                            Store (0x0B, PMD0)
                                        }

                                        If (LEqual (0x05, Local2))
                                        {
                                            Store (0x0C, PMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD0)
                                }

                                If (And (SYNC, 0x04))
                                {
                                    Store (Or (SDT2, 0x40), DMD0)
                                    If (And (ICR1, 0x04))
                                    {
                                        If (And (ICR0, 0x04))
                                        {
                                            Add (DMD0, 0x02, DMD0)
                                        }

                                        If (And (ICR3, 0x04))
                                        {
                                            Store (0x45, DMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                                }

                                Return (SIB0)
                            }
                            Return (SIB0)
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, Serialized)  // _GTF: Get Task File
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (SIB1, Buffer (0x0E)
                                {
                                    /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03,
                                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                })
                                CreateByteField (SIB1, One, PMD1)
                                CreateByteField (SIB1, 0x08, DMD1)
                                If (And (SECT, 0x20))
                                {
                                    If (LEqual (And (SECT, 0x90), 0x80))
                                    {
                                        Store (0x08, PMD1)
                                    }
                                    Else
                                    {
                                        Add (And (SSIT, 0x03), ShiftRight (And (SSIT, 0x0C), 
                                            0x02), Local0)
                                        If (LEqual (0x05, Local0))
                                        {
                                            Store (0x0C, PMD1)
                                        }
                                        Else
                                        {
                                            If (LEqual (0x03, Local0))
                                            {
                                                Store (0x0B, PMD1)
                                            }
                                            Else
                                            {
                                                Store (0x0A, PMD1)
                                            }
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD1)
                                }

                                If (And (SYNC, 0x08))
                                {
                                    Store (Or (SDT3, 0x40), DMD1)
                                    If (And (ICR1, 0x08))
                                    {
                                        If (And (ICR0, 0x08))
                                        {
                                            Add (DMD1, 0x02, DMD1)
                                        }

                                        If (And (ICR3, 0x08))
                                        {
                                            Store (0x45, DMD1)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                                }

                                Return (SIB1)
                            }
                            Return (SIB1)
                        }
                    }
                }

                Device (PT4D)
                {
                    Name (_ADR, 0x04)  // _ADR: Address
                    Method (_GTM, 0, Serialized)  // _GTM: Get Timing Mode
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            Name (SBUF, Buffer (0x14)
                            {
                                /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0010 */   0x00, 0x00, 0x00, 0x00
                            })
                            CreateDWordField (SBUF, Zero, PIO0)
                            CreateDWordField (SBUF, 0x04, DMA0)
                            CreateDWordField (SBUF, 0x08, PIO1)
                            CreateDWordField (SBUF, 0x0C, DMA1)
                            CreateDWordField (SBUF, 0x10, FLAG)
                            Store (GETP (SECT), PIO0)
                            Store (GDMA (And (SYNC, 0x04), And (ICR3, 0x04), 
                                And (ICR0, 0x04), SDT2, And (ICR1, 0x04)), DMA0)
                            If (LEqual (DMA0, Ones))
                            {
                                Store (PIO0, DMA0)
                            }

                            If (And (SECT, 0x4000))
                            {
                                If (LEqual (And (SECT, 0x90), 0x80))
                                {
                                    Store (0x0384, PIO1)
                                }
                                Else
                                {
                                    Store (GETT (SSIT), PIO1)
                                }
                            }
                            Else
                            {
                                Store (Ones, PIO1)
                            }

                            Store (GDMA (And (SYNC, 0x08), And (ICR3, 0x08), 
                                And (ICR0, 0x08), SDT3, And (ICR1, 0x08)), DMA1)
                            If (LEqual (DMA1, Ones))
                            {
                                Store (PIO1, DMA1)
                            }

                            Store (GETF (And (SYNC, 0x04), And (SYNC, 0x08), 
                                SECT), FLAG)
                            Return (SBUF)
                        }
                        Return (SBUF)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            CreateDWordField (Arg0, Zero, PIO0)
                            CreateDWordField (Arg0, 0x04, DMA0)
                            CreateDWordField (Arg0, 0x08, PIO1)
                            CreateDWordField (Arg0, 0x0C, DMA1)
                            CreateDWordField (Arg0, 0x10, FLAG)
                            If (LEqual (SizeOf (Arg1), 0x0200))
                            {
                                And (SECT, 0x40F0, SECT)
                                And (SYNC, 0x0B, SYNC)
                                Store (Zero, SDT2)
                                And (ICR0, 0x0B, ICR0)
                                And (ICR1, 0x0B, ICR1)
                                And (ICR3, 0x0B, ICR3)
                                And (ICR5, 0x0B, ICR5)
                                CreateWordField (Arg1, 0x62, W490)
                                CreateWordField (Arg1, 0x6A, W530)
                                CreateWordField (Arg1, 0x80, W640)
                                Or (SECT, 0x8004, SECT)
                                If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                                {
                                    Or (SECT, 0x02, SECT)
                                }

                                Or (SECT, SETP (PIO0, W530, W640), SECT)
                                If (And (FLAG, One))
                                {
                                    Or (SYNC, 0x04, SYNC)
                                    Store (SDMA (DMA0), SDT2)
                                    If (LLess (DMA0, 0x1E))
                                    {
                                        Or (ICR3, 0x04, ICR3)
                                    }

                                    If (LLess (DMA0, 0x3C))
                                    {
                                        Or (ICR0, 0x04, ICR0)
                                    }

                                    Or (ICR1, 0x04, ICR1)
                                }
                            }

                            If (LEqual (SizeOf (Arg2), 0x0200))
                            {
                                And (SECT, 0x3F0F, SECT)
                                Store (Zero, SSIT)
                                And (SYNC, 0x07, SYNC)
                                Store (Zero, SDT3)
                                And (ICR0, 0x07, ICR0)
                                And (ICR1, 0x07, ICR1)
                                And (ICR3, 0x07, ICR3)
                                And (ICR5, 0x07, ICR5)
                                CreateWordField (Arg2, 0x62, W491)
                                CreateWordField (Arg2, 0x6A, W531)
                                CreateWordField (Arg2, 0x80, W641)
                                Or (SECT, 0x8040, SECT)
                                If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                                {
                                    Or (SECT, 0x20, SECT)
                                }

                                If (And (FLAG, 0x10))
                                {
                                    Or (SECT, 0x4000, SECT)
                                    If (LGreater (PIO1, 0xF0))
                                    {
                                        Or (SECT, 0x80, SECT)
                                    }
                                    Else
                                    {
                                        Or (SECT, 0x10, SECT)
                                        Store (SETT (PIO1, W531, W641), SSIT)
                                    }
                                }

                                If (And (FLAG, 0x04))
                                {
                                    Or (SYNC, 0x08, SYNC)
                                    Store (SDMA (DMA1), SDT3)
                                    If (LLess (DMA1, 0x1E))
                                    {
                                        Or (ICR3, 0x08, ICR3)
                                    }

                                    If (LLess (DMA1, 0x3C))
                                    {
                                        Or (ICR0, 0x08, ICR0)
                                    }

                                    Or (ICR1, 0x08, ICR1)
                                }
                            }
                        }
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (One)
                        }

                        Method (_GTF, 0, Serialized)  // _GTF: Get Task File
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (SIB0, Buffer (0x0E)
                                {
                                    /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03,
                                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                })
                                CreateByteField (SIB0, One, PMD0)
                                CreateByteField (SIB0, 0x08, DMD0)
                                If (And (SECT, 0x02))
                                {
                                    If (LEqual (And (SECT, 0x09), 0x08))
                                    {
                                        Store (0x08, PMD0)
                                    }
                                    Else
                                    {
                                        Store (0x0A, PMD0)
                                        ShiftRight (And (SECT, 0x0300), 0x08, Local0)
                                        ShiftRight (And (SECT, 0x3000), 0x0C, Local1)
                                        Add (Local0, Local1, Local2)
                                        If (LEqual (0x03, Local2))
                                        {
                                            Store (0x0B, PMD0)
                                        }

                                        If (LEqual (0x05, Local2))
                                        {
                                            Store (0x0C, PMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD0)
                                }

                                If (And (SYNC, 0x04))
                                {
                                    Store (Or (SDT2, 0x40), DMD0)
                                    If (And (ICR1, 0x04))
                                    {
                                        If (And (ICR0, 0x04))
                                        {
                                            Add (DMD0, 0x02, DMD0)
                                        }

                                        If (And (ICR3, 0x04))
                                        {
                                            Store (0x45, DMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                                }

                                Return (SIB0)
                            }
                            Return (SIB0)
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (One)
                        }

                        Method (_GTF, 0, Serialized)  // _GTF: Get Task File
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (SIB1, Buffer (0x0E)
                                {
                                    /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03,
                                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                })
                                CreateByteField (SIB1, One, PMD1)
                                CreateByteField (SIB1, 0x08, DMD1)
                                If (And (SECT, 0x20))
                                {
                                    If (LEqual (And (SECT, 0x90), 0x80))
                                    {
                                        Store (0x08, PMD1)
                                    }
                                    Else
                                    {
                                        Add (And (SSIT, 0x03), ShiftRight (And (SSIT, 0x0C), 
                                            0x02), Local0)
                                        If (LEqual (0x05, Local0))
                                        {
                                            Store (0x0C, PMD1)
                                        }
                                        Else
                                        {
                                            If (LEqual (0x03, Local0))
                                            {
                                                Store (0x0B, PMD1)
                                            }
                                            Else
                                            {
                                                Store (0x0A, PMD1)
                                            }
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD1)
                                }

                                If (And (SYNC, 0x08))
                                {
                                    Store (Or (SDT3, 0x40), DMD1)
                                    If (And (ICR1, 0x08))
                                    {
                                        If (And (ICR0, 0x08))
                                        {
                                            Add (DMD1, 0x02, DMD1)
                                        }

                                        If (And (ICR3, 0x08))
                                        {
                                            Store (0x45, DMD1)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                                }

                                Return (SIB1)
                            }
                            Return (SIB1)
                        }
                    }
                }

                Device (PT5D)
                {
                    Name (_ADR, 0x05)  // _ADR: Address
                    Method (_GTM, 0, Serialized)  // _GTM: Get Timing Mode
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            Name (SBUF, Buffer (0x14)
                            {
                                /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0010 */   0x00, 0x00, 0x00, 0x00
                            })
                            CreateDWordField (SBUF, Zero, PIO0)
                            CreateDWordField (SBUF, 0x04, DMA0)
                            CreateDWordField (SBUF, 0x08, PIO1)
                            CreateDWordField (SBUF, 0x0C, DMA1)
                            CreateDWordField (SBUF, 0x10, FLAG)
                            Store (GETP (SECT), PIO0)
                            Store (GDMA (And (SYNC, 0x04), And (ICR3, 0x04), 
                                And (ICR0, 0x04), SDT2, And (ICR1, 0x04)), DMA0)
                            If (LEqual (DMA0, Ones))
                            {
                                Store (PIO0, DMA0)
                            }

                            If (And (SECT, 0x4000))
                            {
                                If (LEqual (And (SECT, 0x90), 0x80))
                                {
                                    Store (0x0384, PIO1)
                                }
                                Else
                                {
                                    Store (GETT (SSIT), PIO1)
                                }
                            }
                            Else
                            {
                                Store (Ones, PIO1)
                            }

                            Store (GDMA (And (SYNC, 0x08), And (ICR3, 0x08), 
                                And (ICR0, 0x08), SDT3, And (ICR1, 0x08)), DMA1)
                            If (LEqual (DMA1, Ones))
                            {
                                Store (PIO1, DMA1)
                            }

                            Store (GETF (And (SYNC, 0x04), And (SYNC, 0x08), 
                                SECT), FLAG)
                            Return (SBUF)
                        }
                        Return (SBUF)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            CreateDWordField (Arg0, Zero, PIO0)
                            CreateDWordField (Arg0, 0x04, DMA0)
                            CreateDWordField (Arg0, 0x08, PIO1)
                            CreateDWordField (Arg0, 0x0C, DMA1)
                            CreateDWordField (Arg0, 0x10, FLAG)
                            If (LEqual (SizeOf (Arg1), 0x0200))
                            {
                                And (SECT, 0x40F0, SECT)
                                And (SYNC, 0x0B, SYNC)
                                Store (Zero, SDT2)
                                And (ICR0, 0x0B, ICR0)
                                And (ICR1, 0x0B, ICR1)
                                And (ICR3, 0x0B, ICR3)
                                And (ICR5, 0x0B, ICR5)
                                CreateWordField (Arg1, 0x62, W490)
                                CreateWordField (Arg1, 0x6A, W530)
                                CreateWordField (Arg1, 0x80, W640)
                                Or (SECT, 0x8004, SECT)
                                If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                                {
                                    Or (SECT, 0x02, SECT)
                                }

                                Or (SECT, SETP (PIO0, W530, W640), SECT)
                                If (And (FLAG, One))
                                {
                                    Or (SYNC, 0x04, SYNC)
                                    Store (SDMA (DMA0), SDT2)
                                    If (LLess (DMA0, 0x1E))
                                    {
                                        Or (ICR3, 0x04, ICR3)
                                    }

                                    If (LLess (DMA0, 0x3C))
                                    {
                                        Or (ICR0, 0x04, ICR0)
                                    }

                                    Or (ICR1, 0x04, ICR1)
                                }
                            }

                            If (LEqual (SizeOf (Arg2), 0x0200))
                            {
                                And (SECT, 0x3F0F, SECT)
                                Store (Zero, SSIT)
                                And (SYNC, 0x07, SYNC)
                                Store (Zero, SDT3)
                                And (ICR0, 0x07, ICR0)
                                And (ICR1, 0x07, ICR1)
                                And (ICR3, 0x07, ICR3)
                                And (ICR5, 0x07, ICR5)
                                CreateWordField (Arg2, 0x62, W491)
                                CreateWordField (Arg2, 0x6A, W531)
                                CreateWordField (Arg2, 0x80, W641)
                                Or (SECT, 0x8040, SECT)
                                If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                                {
                                    Or (SECT, 0x20, SECT)
                                }

                                If (And (FLAG, 0x10))
                                {
                                    Or (SECT, 0x4000, SECT)
                                    If (LGreater (PIO1, 0xF0))
                                    {
                                        Or (SECT, 0x80, SECT)
                                    }
                                    Else
                                    {
                                        Or (SECT, 0x10, SECT)
                                        Store (SETT (PIO1, W531, W641), SSIT)
                                    }
                                }

                                If (And (FLAG, 0x04))
                                {
                                    Or (SYNC, 0x08, SYNC)
                                    Store (SDMA (DMA1), SDT3)
                                    If (LLess (DMA1, 0x1E))
                                    {
                                        Or (ICR3, 0x08, ICR3)
                                    }

                                    If (LLess (DMA1, 0x3C))
                                    {
                                        Or (ICR0, 0x08, ICR0)
                                    }

                                    Or (ICR1, 0x08, ICR1)
                                }
                            }
                        }
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (One)
                        }

                        Method (_GTF, 0, Serialized)  // _GTF: Get Task File
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (SIB0, Buffer (0x0E)
                                {
                                    /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03,
                                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                })
                                CreateByteField (SIB0, One, PMD0)
                                CreateByteField (SIB0, 0x08, DMD0)
                                If (And (SECT, 0x02))
                                {
                                    If (LEqual (And (SECT, 0x09), 0x08))
                                    {
                                        Store (0x08, PMD0)
                                    }
                                    Else
                                    {
                                        Store (0x0A, PMD0)
                                        ShiftRight (And (SECT, 0x0300), 0x08, Local0)
                                        ShiftRight (And (SECT, 0x3000), 0x0C, Local1)
                                        Add (Local0, Local1, Local2)
                                        If (LEqual (0x03, Local2))
                                        {
                                            Store (0x0B, PMD0)
                                        }

                                        If (LEqual (0x05, Local2))
                                        {
                                            Store (0x0C, PMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD0)
                                }

                                If (And (SYNC, 0x04))
                                {
                                    Store (Or (SDT2, 0x40), DMD0)
                                    If (And (ICR1, 0x04))
                                    {
                                        If (And (ICR0, 0x04))
                                        {
                                            Add (DMD0, 0x02, DMD0)
                                        }

                                        If (And (ICR3, 0x04))
                                        {
                                            Store (0x45, DMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                                }

                                Return (SIB0)
                            }
                            Return (SIB0)
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (One)
                        }

                        Method (_GTF, 0, Serialized)  // _GTF: Get Task File
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (SIB1, Buffer (0x0E)
                                {
                                    /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03,
                                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                })
                                CreateByteField (SIB1, One, PMD1)
                                CreateByteField (SIB1, 0x08, DMD1)
                                If (And (SECT, 0x20))
                                {
                                    If (LEqual (And (SECT, 0x90), 0x80))
                                    {
                                        Store (0x08, PMD1)
                                    }
                                    Else
                                    {
                                        Add (And (SSIT, 0x03), ShiftRight (And (SSIT, 0x0C), 
                                            0x02), Local0)
                                        If (LEqual (0x05, Local0))
                                        {
                                            Store (0x0C, PMD1)
                                        }
                                        Else
                                        {
                                            If (LEqual (0x03, Local0))
                                            {
                                                Store (0x0B, PMD1)
                                            }
                                            Else
                                            {
                                                Store (0x0A, PMD1)
                                            }
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD1)
                                }

                                If (And (SYNC, 0x08))
                                {
                                    Store (Or (SDT3, 0x40), DMD1)
                                    If (And (ICR1, 0x08))
                                    {
                                        If (And (ICR0, 0x08))
                                        {
                                            Add (DMD1, 0x02, DMD1)
                                        }

                                        If (And (ICR3, 0x08))
                                        {
                                            Store (0x45, DMD1)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                                }

                                Return (SIB1)
                            }
                            Return (SIB1)
                        }
                    }
                }
            }

            Device (SAT1)
            {
                Name (_ADR, 0x001F0005)  // _ADR: Address
                OperationRegion (SACS, PCI_Config, 0x40, 0xC0)
                Field (SACS, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                    SECT,   16, 
                    PSIT,   4, 
                    SSIT,   4, 
                    Offset (0x08), 
                    SYNC,   4, 
                    Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                    Offset (0x0B), 
                    SDT2,   2, 
                        ,   2, 
                    SDT3,   2, 
                    Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    ICR4,   4, 
                    ICR5,   4, 
                    Offset (0x50), 
                    MAPV,   2
                }

                Device (PRID)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, Serialized)  // _GTM: Get Timing Mode
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            Name (PBUF, Buffer (0x14)
                            {
                                /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0010 */   0x00, 0x00, 0x00, 0x00
                            })
                            CreateDWordField (PBUF, Zero, PIO0)
                            CreateDWordField (PBUF, 0x04, DMA0)
                            CreateDWordField (PBUF, 0x08, PIO1)
                            CreateDWordField (PBUF, 0x0C, DMA1)
                            CreateDWordField (PBUF, 0x10, FLAG)
                            Store (GETP (PRIT), PIO0)
                            Store (GDMA (And (SYNC, One), And (ICR3, One), 
                                And (ICR0, One), SDT0, And (ICR1, One)), DMA0)
                            If (LEqual (DMA0, Ones))
                            {
                                Store (PIO0, DMA0)
                            }

                            If (And (PRIT, 0x4000))
                            {
                                If (LEqual (And (PRIT, 0x90), 0x80))
                                {
                                    Store (0x0384, PIO1)
                                }
                                Else
                                {
                                    Store (GETT (PSIT), PIO1)
                                }
                            }
                            Else
                            {
                                Store (Ones, PIO1)
                            }

                            Store (GDMA (And (SYNC, 0x02), And (ICR3, 0x02), 
                                And (ICR0, 0x02), SDT1, And (ICR1, 0x02)), DMA1)
                            If (LEqual (DMA1, Ones))
                            {
                                Store (PIO1, DMA1)
                            }

                            Store (GETF (And (SYNC, One), And (SYNC, 0x02), 
                                PRIT), FLAG)
                            Return (PBUF)
                        }
                        Return (PBUF)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            CreateDWordField (Arg0, Zero, PIO0)
                            CreateDWordField (Arg0, 0x04, DMA0)
                            CreateDWordField (Arg0, 0x08, PIO1)
                            CreateDWordField (Arg0, 0x0C, DMA1)
                            CreateDWordField (Arg0, 0x10, FLAG)
                            If (LEqual (SizeOf (Arg1), 0x0200))
                            {
                                And (PRIT, 0x40F0, PRIT)
                                And (SYNC, 0x0E, SYNC)
                                Store (Zero, SDT0)
                                And (ICR0, 0x0E, ICR0)
                                And (ICR1, 0x0E, ICR1)
                                And (ICR3, 0x0E, ICR3)
                                And (ICR5, 0x0E, ICR5)
                                CreateWordField (Arg1, 0x62, W490)
                                CreateWordField (Arg1, 0x6A, W530)
                                CreateWordField (Arg1, 0x80, W640)
                                Or (PRIT, 0x8004, PRIT)
                                If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                                {
                                    Or (PRIT, 0x02, PRIT)
                                }

                                Or (PRIT, SETP (PIO0, W530, W640), PRIT)
                                If (And (FLAG, One))
                                {
                                    Or (SYNC, One, SYNC)
                                    Store (SDMA (DMA0), SDT0)
                                    If (LLess (DMA0, 0x1E))
                                    {
                                        Or (ICR3, One, ICR3)
                                    }

                                    If (LLess (DMA0, 0x3C))
                                    {
                                        Or (ICR0, One, ICR0)
                                    }

                                    Or (ICR1, One, ICR1)
                                }
                            }

                            If (LEqual (SizeOf (Arg2), 0x0200))
                            {
                                And (PRIT, 0x3F0F, PRIT)
                                Store (Zero, PSIT)
                                And (SYNC, 0x0D, SYNC)
                                Store (Zero, SDT1)
                                And (ICR0, 0x0D, ICR0)
                                And (ICR1, 0x0D, ICR1)
                                And (ICR3, 0x0D, ICR3)
                                And (ICR5, 0x0D, ICR5)
                                CreateWordField (Arg2, 0x62, W491)
                                CreateWordField (Arg2, 0x6A, W531)
                                CreateWordField (Arg2, 0x80, W641)
                                Or (PRIT, 0x8040, PRIT)
                                If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                                {
                                    Or (PRIT, 0x20, PRIT)
                                }

                                If (And (FLAG, 0x10))
                                {
                                    Or (PRIT, 0x4000, PRIT)
                                    If (LGreater (PIO1, 0xF0))
                                    {
                                        Or (PRIT, 0x80, PRIT)
                                    }
                                    Else
                                    {
                                        Or (PRIT, 0x10, PRIT)
                                        Store (SETT (PIO1, W531, W641), PSIT)
                                    }
                                }

                                If (And (FLAG, 0x04))
                                {
                                    Or (SYNC, 0x02, SYNC)
                                    Store (SDMA (DMA1), SDT1)
                                    If (LLess (DMA1, 0x1E))
                                    {
                                        Or (ICR3, 0x02, ICR3)
                                    }

                                    If (LLess (DMA1, 0x3C))
                                    {
                                        Or (ICR0, 0x02, ICR0)
                                    }

                                    Or (ICR1, 0x02, ICR1)
                                }
                            }
                        }
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, Serialized)  // _GTF: Get Task File
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (PIB0, Buffer (0x0E)
                                {
                                    /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03,
                                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                })
                                CreateByteField (PIB0, One, PMD0)
                                CreateByteField (PIB0, 0x08, DMD0)
                                If (And (PRIT, 0x02))
                                {
                                    If (LEqual (And (PRIT, 0x09), 0x08))
                                    {
                                        Store (0x08, PMD0)
                                    }
                                    Else
                                    {
                                        Store (0x0A, PMD0)
                                        ShiftRight (And (PRIT, 0x0300), 0x08, Local0)
                                        ShiftRight (And (PRIT, 0x3000), 0x0C, Local1)
                                        Add (Local0, Local1, Local2)
                                        If (LEqual (0x03, Local2))
                                        {
                                            Store (0x0B, PMD0)
                                        }

                                        If (LEqual (0x05, Local2))
                                        {
                                            Store (0x0C, PMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD0)
                                }

                                If (And (SYNC, One))
                                {
                                    Store (Or (SDT0, 0x40), DMD0)
                                    If (And (ICR1, One))
                                    {
                                        If (And (ICR0, One))
                                        {
                                            Add (DMD0, 0x02, DMD0)
                                        }

                                        If (And (ICR3, One))
                                        {
                                            Store (0x45, DMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                                }

                                Return (PIB0)
                            }
                            Return (PIB0)
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, Serialized)  // _GTF: Get Task File
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (PIB1, Buffer (0x0E)
                                {
                                    /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03,
                                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                })
                                CreateByteField (PIB1, One, PMD1)
                                CreateByteField (PIB1, 0x08, DMD1)
                                If (And (PRIT, 0x20))
                                {
                                    If (LEqual (And (PRIT, 0x90), 0x80))
                                    {
                                        Store (0x08, PMD1)
                                    }
                                    Else
                                    {
                                        Add (And (PSIT, 0x03), ShiftRight (And (PSIT, 0x0C), 
                                            0x02), Local0)
                                        If (LEqual (0x05, Local0))
                                        {
                                            Store (0x0C, PMD1)
                                        }
                                        Else
                                        {
                                            If (LEqual (0x03, Local0))
                                            {
                                                Store (0x0B, PMD1)
                                            }
                                            Else
                                            {
                                                Store (0x0A, PMD1)
                                            }
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD1)
                                }

                                If (And (SYNC, 0x02))
                                {
                                    Store (Or (SDT1, 0x40), DMD1)
                                    If (And (ICR1, 0x02))
                                    {
                                        If (And (ICR0, 0x02))
                                        {
                                            Add (DMD1, 0x02, DMD1)
                                        }

                                        If (And (ICR3, 0x02))
                                        {
                                            Store (0x45, DMD1)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                                }

                                Return (PIB1)
                            }
                            Return (PIB1)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, Serialized)  // _GTM: Get Timing Mode
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            Name (SBUF, Buffer (0x14)
                            {
                                /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0010 */   0x00, 0x00, 0x00, 0x00
                            })
                            CreateDWordField (SBUF, Zero, PIO0)
                            CreateDWordField (SBUF, 0x04, DMA0)
                            CreateDWordField (SBUF, 0x08, PIO1)
                            CreateDWordField (SBUF, 0x0C, DMA1)
                            CreateDWordField (SBUF, 0x10, FLAG)
                            Store (GETP (SECT), PIO0)
                            Store (GDMA (And (SYNC, 0x04), And (ICR3, 0x04), 
                                And (ICR0, 0x04), SDT2, And (ICR1, 0x04)), DMA0)
                            If (LEqual (DMA0, Ones))
                            {
                                Store (PIO0, DMA0)
                            }

                            If (And (SECT, 0x4000))
                            {
                                If (LEqual (And (SECT, 0x90), 0x80))
                                {
                                    Store (0x0384, PIO1)
                                }
                                Else
                                {
                                    Store (GETT (SSIT), PIO1)
                                }
                            }
                            Else
                            {
                                Store (Ones, PIO1)
                            }

                            Store (GDMA (And (SYNC, 0x08), And (ICR3, 0x08), 
                                And (ICR0, 0x08), SDT3, And (ICR1, 0x08)), DMA1)
                            If (LEqual (DMA1, Ones))
                            {
                                Store (PIO1, DMA1)
                            }

                            Store (GETF (And (SYNC, 0x04), And (SYNC, 0x08), 
                                SECT), FLAG)
                            Return (SBUF)
                        }
                        Return (SBUF)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            CreateDWordField (Arg0, Zero, PIO0)
                            CreateDWordField (Arg0, 0x04, DMA0)
                            CreateDWordField (Arg0, 0x08, PIO1)
                            CreateDWordField (Arg0, 0x0C, DMA1)
                            CreateDWordField (Arg0, 0x10, FLAG)
                            If (LEqual (SizeOf (Arg1), 0x0200))
                            {
                                And (SECT, 0x40F0, SECT)
                                And (SYNC, 0x0B, SYNC)
                                Store (Zero, SDT2)
                                And (ICR0, 0x0B, ICR0)
                                And (ICR1, 0x0B, ICR1)
                                And (ICR3, 0x0B, ICR3)
                                And (ICR5, 0x0B, ICR5)
                                CreateWordField (Arg1, 0x62, W490)
                                CreateWordField (Arg1, 0x6A, W530)
                                CreateWordField (Arg1, 0x80, W640)
                                Or (SECT, 0x8004, SECT)
                                If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                                {
                                    Or (SECT, 0x02, SECT)
                                }

                                Or (SECT, SETP (PIO0, W530, W640), SECT)
                                If (And (FLAG, One))
                                {
                                    Or (SYNC, 0x04, SYNC)
                                    Store (SDMA (DMA0), SDT2)
                                    If (LLess (DMA0, 0x1E))
                                    {
                                        Or (ICR3, 0x04, ICR3)
                                    }

                                    If (LLess (DMA0, 0x3C))
                                    {
                                        Or (ICR0, 0x04, ICR0)
                                    }

                                    Or (ICR1, 0x04, ICR1)
                                }
                            }

                            If (LEqual (SizeOf (Arg2), 0x0200))
                            {
                                And (SECT, 0x3F0F, SECT)
                                Store (Zero, SSIT)
                                And (SYNC, 0x07, SYNC)
                                Store (Zero, SDT3)
                                And (ICR0, 0x07, ICR0)
                                And (ICR1, 0x07, ICR1)
                                And (ICR3, 0x07, ICR3)
                                And (ICR5, 0x07, ICR5)
                                CreateWordField (Arg2, 0x62, W491)
                                CreateWordField (Arg2, 0x6A, W531)
                                CreateWordField (Arg2, 0x80, W641)
                                Or (SECT, 0x8040, SECT)
                                If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                                {
                                    Or (SECT, 0x20, SECT)
                                }

                                If (And (FLAG, 0x10))
                                {
                                    Or (SECT, 0x4000, SECT)
                                    If (LGreater (PIO1, 0xF0))
                                    {
                                        Or (SECT, 0x80, SECT)
                                    }
                                    Else
                                    {
                                        Or (SECT, 0x10, SECT)
                                        Store (SETT (PIO1, W531, W641), SSIT)
                                    }
                                }

                                If (And (FLAG, 0x04))
                                {
                                    Or (SYNC, 0x08, SYNC)
                                    Store (SDMA (DMA1), SDT3)
                                    If (LLess (DMA1, 0x1E))
                                    {
                                        Or (ICR3, 0x08, ICR3)
                                    }

                                    If (LLess (DMA1, 0x3C))
                                    {
                                        Or (ICR0, 0x08, ICR0)
                                    }

                                    Or (ICR1, 0x08, ICR1)
                                }
                            }
                        }
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, Serialized)  // _GTF: Get Task File
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (SIB0, Buffer (0x0E)
                                {
                                    /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03,
                                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                })
                                CreateByteField (SIB0, One, PMD0)
                                CreateByteField (SIB0, 0x08, DMD0)
                                If (And (SECT, 0x02))
                                {
                                    If (LEqual (And (SECT, 0x09), 0x08))
                                    {
                                        Store (0x08, PMD0)
                                    }
                                    Else
                                    {
                                        Store (0x0A, PMD0)
                                        ShiftRight (And (SECT, 0x0300), 0x08, Local0)
                                        ShiftRight (And (SECT, 0x3000), 0x0C, Local1)
                                        Add (Local0, Local1, Local2)
                                        If (LEqual (0x03, Local2))
                                        {
                                            Store (0x0B, PMD0)
                                        }

                                        If (LEqual (0x05, Local2))
                                        {
                                            Store (0x0C, PMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD0)
                                }

                                If (And (SYNC, 0x04))
                                {
                                    Store (Or (SDT2, 0x40), DMD0)
                                    If (And (ICR1, 0x04))
                                    {
                                        If (And (ICR0, 0x04))
                                        {
                                            Add (DMD0, 0x02, DMD0)
                                        }

                                        If (And (ICR3, 0x04))
                                        {
                                            Store (0x45, DMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                                }

                                Return (SIB0)
                            }
                            Return (SIB0)
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, Serialized)  // _GTF: Get Task File
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (SIB1, Buffer (0x0E)
                                {
                                    /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03,
                                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                })
                                CreateByteField (SIB1, One, PMD1)
                                CreateByteField (SIB1, 0x08, DMD1)
                                If (And (SECT, 0x20))
                                {
                                    If (LEqual (And (SECT, 0x90), 0x80))
                                    {
                                        Store (0x08, PMD1)
                                    }
                                    Else
                                    {
                                        Add (And (SSIT, 0x03), ShiftRight (And (SSIT, 0x0C), 
                                            0x02), Local0)
                                        If (LEqual (0x05, Local0))
                                        {
                                            Store (0x0C, PMD1)
                                        }
                                        Else
                                        {
                                            If (LEqual (0x03, Local0))
                                            {
                                                Store (0x0B, PMD1)
                                            }
                                            Else
                                            {
                                                Store (0x0A, PMD1)
                                            }
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD1)
                                }

                                If (And (SYNC, 0x08))
                                {
                                    Store (Or (SDT3, 0x40), DMD1)
                                    If (And (ICR1, 0x08))
                                    {
                                        If (And (ICR0, 0x08))
                                        {
                                            Add (DMD1, 0x02, DMD1)
                                        }

                                        If (And (ICR3, 0x08))
                                        {
                                            Store (0x45, DMD1)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                                }

                                Return (SIB1)
                            }
                            Return (SIB1)
                        }
                    }
                }

                Device (PT4D)
                {
                    Name (_ADR, 0x04)  // _ADR: Address
                    Method (_GTM, 0, Serialized)  // _GTM: Get Timing Mode
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            Name (SBUF, Buffer (0x14)
                            {
                                /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0010 */   0x00, 0x00, 0x00, 0x00
                            })
                            CreateDWordField (SBUF, Zero, PIO0)
                            CreateDWordField (SBUF, 0x04, DMA0)
                            CreateDWordField (SBUF, 0x08, PIO1)
                            CreateDWordField (SBUF, 0x0C, DMA1)
                            CreateDWordField (SBUF, 0x10, FLAG)
                            Store (GETP (SECT), PIO0)
                            Store (GDMA (And (SYNC, 0x04), And (ICR3, 0x04), 
                                And (ICR0, 0x04), SDT2, And (ICR1, 0x04)), DMA0)
                            If (LEqual (DMA0, Ones))
                            {
                                Store (PIO0, DMA0)
                            }

                            If (And (SECT, 0x4000))
                            {
                                If (LEqual (And (SECT, 0x90), 0x80))
                                {
                                    Store (0x0384, PIO1)
                                }
                                Else
                                {
                                    Store (GETT (SSIT), PIO1)
                                }
                            }
                            Else
                            {
                                Store (Ones, PIO1)
                            }

                            Store (GDMA (And (SYNC, 0x08), And (ICR3, 0x08), 
                                And (ICR0, 0x08), SDT3, And (ICR1, 0x08)), DMA1)
                            If (LEqual (DMA1, Ones))
                            {
                                Store (PIO1, DMA1)
                            }

                            Store (GETF (And (SYNC, 0x04), And (SYNC, 0x08), 
                                SECT), FLAG)
                            Return (SBUF)
                        }
                        Return (SBUF)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            CreateDWordField (Arg0, Zero, PIO0)
                            CreateDWordField (Arg0, 0x04, DMA0)
                            CreateDWordField (Arg0, 0x08, PIO1)
                            CreateDWordField (Arg0, 0x0C, DMA1)
                            CreateDWordField (Arg0, 0x10, FLAG)
                            If (LEqual (SizeOf (Arg1), 0x0200))
                            {
                                And (SECT, 0x40F0, SECT)
                                And (SYNC, 0x0B, SYNC)
                                Store (Zero, SDT2)
                                And (ICR0, 0x0B, ICR0)
                                And (ICR1, 0x0B, ICR1)
                                And (ICR3, 0x0B, ICR3)
                                And (ICR5, 0x0B, ICR5)
                                CreateWordField (Arg1, 0x62, W490)
                                CreateWordField (Arg1, 0x6A, W530)
                                CreateWordField (Arg1, 0x80, W640)
                                Or (SECT, 0x8004, SECT)
                                If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                                {
                                    Or (SECT, 0x02, SECT)
                                }

                                Or (SECT, SETP (PIO0, W530, W640), SECT)
                                If (And (FLAG, One))
                                {
                                    Or (SYNC, 0x04, SYNC)
                                    Store (SDMA (DMA0), SDT2)
                                    If (LLess (DMA0, 0x1E))
                                    {
                                        Or (ICR3, 0x04, ICR3)
                                    }

                                    If (LLess (DMA0, 0x3C))
                                    {
                                        Or (ICR0, 0x04, ICR0)
                                    }

                                    Or (ICR1, 0x04, ICR1)
                                }
                            }

                            If (LEqual (SizeOf (Arg2), 0x0200))
                            {
                                And (SECT, 0x3F0F, SECT)
                                Store (Zero, SSIT)
                                And (SYNC, 0x07, SYNC)
                                Store (Zero, SDT3)
                                And (ICR0, 0x07, ICR0)
                                And (ICR1, 0x07, ICR1)
                                And (ICR3, 0x07, ICR3)
                                And (ICR5, 0x07, ICR5)
                                CreateWordField (Arg2, 0x62, W491)
                                CreateWordField (Arg2, 0x6A, W531)
                                CreateWordField (Arg2, 0x80, W641)
                                Or (SECT, 0x8040, SECT)
                                If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                                {
                                    Or (SECT, 0x20, SECT)
                                }

                                If (And (FLAG, 0x10))
                                {
                                    Or (SECT, 0x4000, SECT)
                                    If (LGreater (PIO1, 0xF0))
                                    {
                                        Or (SECT, 0x80, SECT)
                                    }
                                    Else
                                    {
                                        Or (SECT, 0x10, SECT)
                                        Store (SETT (PIO1, W531, W641), SSIT)
                                    }
                                }

                                If (And (FLAG, 0x04))
                                {
                                    Or (SYNC, 0x08, SYNC)
                                    Store (SDMA (DMA1), SDT3)
                                    If (LLess (DMA1, 0x1E))
                                    {
                                        Or (ICR3, 0x08, ICR3)
                                    }

                                    If (LLess (DMA1, 0x3C))
                                    {
                                        Or (ICR0, 0x08, ICR0)
                                    }

                                    Or (ICR1, 0x08, ICR1)
                                }
                            }
                        }
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (One)
                        }

                        Method (_GTF, 0, Serialized)  // _GTF: Get Task File
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (SIB0, Buffer (0x0E)
                                {
                                    /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03,
                                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                })
                                CreateByteField (SIB0, One, PMD0)
                                CreateByteField (SIB0, 0x08, DMD0)
                                If (And (SECT, 0x02))
                                {
                                    If (LEqual (And (SECT, 0x09), 0x08))
                                    {
                                        Store (0x08, PMD0)
                                    }
                                    Else
                                    {
                                        Store (0x0A, PMD0)
                                        ShiftRight (And (SECT, 0x0300), 0x08, Local0)
                                        ShiftRight (And (SECT, 0x3000), 0x0C, Local1)
                                        Add (Local0, Local1, Local2)
                                        If (LEqual (0x03, Local2))
                                        {
                                            Store (0x0B, PMD0)
                                        }

                                        If (LEqual (0x05, Local2))
                                        {
                                            Store (0x0C, PMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD0)
                                }

                                If (And (SYNC, 0x04))
                                {
                                    Store (Or (SDT2, 0x40), DMD0)
                                    If (And (ICR1, 0x04))
                                    {
                                        If (And (ICR0, 0x04))
                                        {
                                            Add (DMD0, 0x02, DMD0)
                                        }

                                        If (And (ICR3, 0x04))
                                        {
                                            Store (0x45, DMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                                }

                                Return (SIB0)
                            }
                            Return (SIB0)
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (One)
                        }

                        Method (_GTF, 0, Serialized)  // _GTF: Get Task File
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (SIB1, Buffer (0x0E)
                                {
                                    /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03,
                                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                })
                                CreateByteField (SIB1, One, PMD1)
                                CreateByteField (SIB1, 0x08, DMD1)
                                If (And (SECT, 0x20))
                                {
                                    If (LEqual (And (SECT, 0x90), 0x80))
                                    {
                                        Store (0x08, PMD1)
                                    }
                                    Else
                                    {
                                        Add (And (SSIT, 0x03), ShiftRight (And (SSIT, 0x0C), 
                                            0x02), Local0)
                                        If (LEqual (0x05, Local0))
                                        {
                                            Store (0x0C, PMD1)
                                        }
                                        Else
                                        {
                                            If (LEqual (0x03, Local0))
                                            {
                                                Store (0x0B, PMD1)
                                            }
                                            Else
                                            {
                                                Store (0x0A, PMD1)
                                            }
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD1)
                                }

                                If (And (SYNC, 0x08))
                                {
                                    Store (Or (SDT3, 0x40), DMD1)
                                    If (And (ICR1, 0x08))
                                    {
                                        If (And (ICR0, 0x08))
                                        {
                                            Add (DMD1, 0x02, DMD1)
                                        }

                                        If (And (ICR3, 0x08))
                                        {
                                            Store (0x45, DMD1)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                                }

                                Return (SIB1)
                            }
                            Return (SIB1)
                        }
                    }
                }

                Device (PT5D)
                {
                    Name (_ADR, 0x05)  // _ADR: Address
                    Method (_GTM, 0, Serialized)  // _GTM: Get Timing Mode
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            Name (SBUF, Buffer (0x14)
                            {
                                /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0010 */   0x00, 0x00, 0x00, 0x00
                            })
                            CreateDWordField (SBUF, Zero, PIO0)
                            CreateDWordField (SBUF, 0x04, DMA0)
                            CreateDWordField (SBUF, 0x08, PIO1)
                            CreateDWordField (SBUF, 0x0C, DMA1)
                            CreateDWordField (SBUF, 0x10, FLAG)
                            Store (GETP (SECT), PIO0)
                            Store (GDMA (And (SYNC, 0x04), And (ICR3, 0x04), 
                                And (ICR0, 0x04), SDT2, And (ICR1, 0x04)), DMA0)
                            If (LEqual (DMA0, Ones))
                            {
                                Store (PIO0, DMA0)
                            }

                            If (And (SECT, 0x4000))
                            {
                                If (LEqual (And (SECT, 0x90), 0x80))
                                {
                                    Store (0x0384, PIO1)
                                }
                                Else
                                {
                                    Store (GETT (SSIT), PIO1)
                                }
                            }
                            Else
                            {
                                Store (Ones, PIO1)
                            }

                            Store (GDMA (And (SYNC, 0x08), And (ICR3, 0x08), 
                                And (ICR0, 0x08), SDT3, And (ICR1, 0x08)), DMA1)
                            If (LEqual (DMA1, Ones))
                            {
                                Store (PIO1, DMA1)
                            }

                            Store (GETF (And (SYNC, 0x04), And (SYNC, 0x08), 
                                SECT), FLAG)
                            Return (SBUF)
                        }
                        Return (SBUF)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            CreateDWordField (Arg0, Zero, PIO0)
                            CreateDWordField (Arg0, 0x04, DMA0)
                            CreateDWordField (Arg0, 0x08, PIO1)
                            CreateDWordField (Arg0, 0x0C, DMA1)
                            CreateDWordField (Arg0, 0x10, FLAG)
                            If (LEqual (SizeOf (Arg1), 0x0200))
                            {
                                And (SECT, 0x40F0, SECT)
                                And (SYNC, 0x0B, SYNC)
                                Store (Zero, SDT2)
                                And (ICR0, 0x0B, ICR0)
                                And (ICR1, 0x0B, ICR1)
                                And (ICR3, 0x0B, ICR3)
                                And (ICR5, 0x0B, ICR5)
                                CreateWordField (Arg1, 0x62, W490)
                                CreateWordField (Arg1, 0x6A, W530)
                                CreateWordField (Arg1, 0x80, W640)
                                Or (SECT, 0x8004, SECT)
                                If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                                {
                                    Or (SECT, 0x02, SECT)
                                }

                                Or (SECT, SETP (PIO0, W530, W640), SECT)
                                If (And (FLAG, One))
                                {
                                    Or (SYNC, 0x04, SYNC)
                                    Store (SDMA (DMA0), SDT2)
                                    If (LLess (DMA0, 0x1E))
                                    {
                                        Or (ICR3, 0x04, ICR3)
                                    }

                                    If (LLess (DMA0, 0x3C))
                                    {
                                        Or (ICR0, 0x04, ICR0)
                                    }

                                    Or (ICR1, 0x04, ICR1)
                                }
                            }

                            If (LEqual (SizeOf (Arg2), 0x0200))
                            {
                                And (SECT, 0x3F0F, SECT)
                                Store (Zero, SSIT)
                                And (SYNC, 0x07, SYNC)
                                Store (Zero, SDT3)
                                And (ICR0, 0x07, ICR0)
                                And (ICR1, 0x07, ICR1)
                                And (ICR3, 0x07, ICR3)
                                And (ICR5, 0x07, ICR5)
                                CreateWordField (Arg2, 0x62, W491)
                                CreateWordField (Arg2, 0x6A, W531)
                                CreateWordField (Arg2, 0x80, W641)
                                Or (SECT, 0x8040, SECT)
                                If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                                {
                                    Or (SECT, 0x20, SECT)
                                }

                                If (And (FLAG, 0x10))
                                {
                                    Or (SECT, 0x4000, SECT)
                                    If (LGreater (PIO1, 0xF0))
                                    {
                                        Or (SECT, 0x80, SECT)
                                    }
                                    Else
                                    {
                                        Or (SECT, 0x10, SECT)
                                        Store (SETT (PIO1, W531, W641), SSIT)
                                    }
                                }

                                If (And (FLAG, 0x04))
                                {
                                    Or (SYNC, 0x08, SYNC)
                                    Store (SDMA (DMA1), SDT3)
                                    If (LLess (DMA1, 0x1E))
                                    {
                                        Or (ICR3, 0x08, ICR3)
                                    }

                                    If (LLess (DMA1, 0x3C))
                                    {
                                        Or (ICR0, 0x08, ICR0)
                                    }

                                    Or (ICR1, 0x08, ICR1)
                                }
                            }
                        }
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (One)
                        }

                        Method (_GTF, 0, Serialized)  // _GTF: Get Task File
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (SIB0, Buffer (0x0E)
                                {
                                    /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03,
                                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                })
                                CreateByteField (SIB0, One, PMD0)
                                CreateByteField (SIB0, 0x08, DMD0)
                                If (And (SECT, 0x02))
                                {
                                    If (LEqual (And (SECT, 0x09), 0x08))
                                    {
                                        Store (0x08, PMD0)
                                    }
                                    Else
                                    {
                                        Store (0x0A, PMD0)
                                        ShiftRight (And (SECT, 0x0300), 0x08, Local0)
                                        ShiftRight (And (SECT, 0x3000), 0x0C, Local1)
                                        Add (Local0, Local1, Local2)
                                        If (LEqual (0x03, Local2))
                                        {
                                            Store (0x0B, PMD0)
                                        }

                                        If (LEqual (0x05, Local2))
                                        {
                                            Store (0x0C, PMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD0)
                                }

                                If (And (SYNC, 0x04))
                                {
                                    Store (Or (SDT2, 0x40), DMD0)
                                    If (And (ICR1, 0x04))
                                    {
                                        If (And (ICR0, 0x04))
                                        {
                                            Add (DMD0, 0x02, DMD0)
                                        }

                                        If (And (ICR3, 0x04))
                                        {
                                            Store (0x45, DMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                                }

                                Return (SIB0)
                            }
                            Return (SIB0)
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (One)
                        }

                        Method (_GTF, 0, Serialized)  // _GTF: Get Task File
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (SIB1, Buffer (0x0E)
                                {
                                    /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03,
                                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                })
                                CreateByteField (SIB1, One, PMD1)
                                CreateByteField (SIB1, 0x08, DMD1)
                                If (And (SECT, 0x20))
                                {
                                    If (LEqual (And (SECT, 0x90), 0x80))
                                    {
                                        Store (0x08, PMD1)
                                    }
                                    Else
                                    {
                                        Add (And (SSIT, 0x03), ShiftRight (And (SSIT, 0x0C), 
                                            0x02), Local0)
                                        If (LEqual (0x05, Local0))
                                        {
                                            Store (0x0C, PMD1)
                                        }
                                        Else
                                        {
                                            If (LEqual (0x03, Local0))
                                            {
                                                Store (0x0B, PMD1)
                                            }
                                            Else
                                            {
                                                Store (0x0A, PMD1)
                                            }
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD1)
                                }

                                If (And (SYNC, 0x08))
                                {
                                    Store (Or (SDT3, 0x40), DMD1)
                                    If (And (ICR1, 0x08))
                                    {
                                        If (And (ICR0, 0x08))
                                        {
                                            Add (DMD1, 0x02, DMD1)
                                        }

                                        If (And (ICR3, 0x08))
                                        {
                                            Store (0x45, DMD1)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                                }

                                Return (SIB1)
                            }
                            Return (SIB1)
                        }
                    }
                }
            }

            Device (MIR)
            {
                Name (_HID, EisaId ("ENE0100"))  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                {
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0xFF2C,             // Range Minimum
                            0xFF2C,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {4}
                    })
                    Return (BUF0)
                }

                Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                {
                    IO (Decode16,
                        0xFF2C,             // Range Minimum
                        0xFF2C,             // Range Maximum
                        0x01,               // Alignment
                        0x04,               // Length
                        )
                    IRQNoFlags ()
                        {4}
                })
            }

            Device (WMID)
            {
                Name (_HID, "PNP0C14")  // _HID: Hardware ID
                Name (_UID, Zero)  // _UID: Unique ID
                Name (ERRD, 0x00010000)
                Name (BUFF, Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                CreateByteField (BUFF, Zero, BF00)
                CreateByteField (BUFF, One, BF01)
                CreateByteField (BUFF, 0x02, BF02)
                CreateByteField (BUFF, 0x03, BF03)
                CreateByteField (BUFF, 0x04, BF04)
                CreateByteField (BUFF, 0x05, BF05)
                CreateByteField (BUFF, 0x06, BF06)
                CreateByteField (BUFF, 0x07, BF07)
                Name (BUF1, Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00
                })
                Name (AADS, Buffer (0x04)
                {
                     0x00
                })
                CreateField (AADS, Zero, 0x04, AS00)
                CreateField (AADS, 0x04, One, AS01)
                CreateField (AADS, 0x05, One, AS02)
                CreateField (AADS, 0x10, 0x10, AS03)
                Name (BAEF, Zero)
                Name (BADF, Zero)
                Name (BADG, Package (0x0D)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    Zero, 
                    0x00010000
                })
                Name (WLDS, Zero)
                Name (WLED, Zero)
                Name (BTDS, Zero)
                Name (BTED, Zero)
                Name (BLDS, Zero)
                Name (BLED, Zero)
                Name (NTDC, Zero)
                Name (NTDV, Zero)
                Name (WLSD, 0x0100)
                Name (WLSE, 0x0101)
                Name (BLTD, 0x0200)
                Name (BLTE, 0x0201)
                Name (LBL0, 0x0300)
                Name (LBL1, 0x0301)
                Name (LBL2, 0x0302)
                Name (LBL3, 0x0303)
                Name (LBL4, 0x0304)
                Name (LBL5, 0x0305)
                Name (LBL6, 0x0306)
                Name (LBL7, 0x0307)
                Name (LBL8, 0x0308)
                Name (LBL9, 0x0309)
                Name (LBLA, 0x030A)
                Name (LBLB, 0x030B)
                Name (LBLC, 0x030C)
                Name (LBLD, 0x030D)
                Name (LBLE, 0x030E)
                Name (LBLF, 0x030F)
                Name (CADI, 0x0401)
                Name (CADO, 0x0400)
                Name (GSEE, 0x0501)
                Name (GSED, 0x0502)
                Name (VAPI, 0x0601)
                Name (VAPO, 0x0600)
                Name (WBBO, 0x0701)
                Name (WBBI, 0x0700)
                Name (G3MD, 0x0800)
                Name (G3ME, 0x0801)
                Name (LANI, 0x0900)
                Name (LANO, 0x0901)
                Name (LDOF, 0x0A00)
                Name (LDON, 0x0A01)
                Name (FNKE, 0x00010002)
                Name (FNF5, 0x00015001)
                Name (BBSB, Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00
                })
                CreateField (BBSB, Zero, 0x10, BBD0)
                CreateField (BBSB, 0x10, 0x10, BBD1)
                Name (TLS0, Zero)
                Name (TLS1, One)
                Name (TLS2, 0x02)
                Name (TLS3, 0x03)
                Name (TLS4, 0x04)
                Name (TLS5, 0x05)
                Name (TLS6, 0x06)
                Name (TLS7, 0x07)
                Name (BCDS, Package (0x0D)
                {
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000
                })
                Name (BDDS, Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00
                })
                CreateField (BDDS, Zero, 0x10, BDD0)
                CreateField (BDDS, 0x10, 0x10, BDD1)
                Name (DSY0, Buffer (0x28)
                {
                    /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0010 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0018 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0020 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY1, Buffer (0x18)
                {
                    /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0010 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY2, Buffer (0x10)
                {
                    /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY3, Buffer (0x18)
                {
                    /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0010 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY4, Buffer (0x10)
                {
                    /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY5, Buffer (0x28)
                {
                    /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0010 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0018 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0020 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                CreateField (DSY0, Zero, 0x40, DY00)
                CreateField (DSY0, 0x40, 0x40, DY01)
                CreateField (DSY0, 0x80, 0x40, DY02)
                CreateField (DSY0, 0xC0, 0x40, DY03)
                CreateField (DSY0, 0x0100, 0x40, DY04)
                CreateField (DSY1, Zero, 0x40, DY10)
                CreateField (DSY1, 0x40, 0x40, DY11)
                CreateField (DSY1, 0x80, 0x40, DY12)
                CreateField (DSY2, Zero, 0x40, DY20)
                CreateField (DSY2, 0x40, 0x10, DY21)
                CreateField (DSY2, 0x50, 0x10, DY22)
                CreateField (DSY0, Zero, 0xC0, DSX4)
                Name (BEDS, Package (0x13)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Name (WIT0, Zero)
                Name (DSY6, Buffer (0x14)
                {
                    /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0010 */   0x00, 0x00, 0x00, 0x00
                })
                CreateField (DSY6, Zero, 0x20, DY60)
                CreateField (DSY6, 0x20, 0x20, DY61)
                CreateField (DSY6, 0x40, 0x20, DY62)
                CreateField (DSY6, 0x60, 0x20, DY63)
                CreateField (DSY6, 0x80, 0x20, DY64)
                Name (WPRW, Buffer (0x14)
                {
                    /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0010 */   0x00, 0x00, 0x00, 0x00
                })
                CreateField (WPRW, Zero, 0x08, WWD0)
                CreateField (WPRW, 0x08, 0x08, WWD1)
                CreateField (WPRW, 0x10, 0x08, WWD2)
                CreateField (WPRW, 0x18, 0x08, WWD3)
                CreateField (WPRW, 0x20, 0x08, WWD4)
                CreateField (WPRW, 0x28, 0x20, WWD5)
                Name (WPCI, Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00
                })
                CreateField (WPCI, Zero, 0x08, WPIR)
                CreateField (WPCI, 0x08, 0x03, WPIF)
                CreateField (WPCI, 0x0B, 0x05, WPID)
                CreateField (WPCI, 0x10, 0x08, WPIB)
                Name (BFDS, Package (0x04)
                {
                    0x02, 
                    0x02, 
                    0x02, 
                    0x02
                })
                Name (GSTS, Zero)
                Name (BFEF, Zero)
                Name (BGEF, Zero)
                Name (BGDS, Package (0x01)
                {
                    One
                })
                Method (AAF1, 0, NotSerialized)
                {
                    Store (^^LPC.EC0.WLEX, AS00)
                    Store (^^LPC.EC0.BTEX, AS01)
                    Store (Zero, AS02)
                    Store (Zero, AS03)
                }

                Method (WGDS, 1, Serialized)
                {
                    Name (T_0, Zero)
                    Store (Arg0, T_0)
                    If (LEqual (T_0, One))
                    {
                        Store (^^LPC.EC0.WLAT, Index (BADG, Zero))
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x02))
                        {
                            Store (^^LPC.EC0.BTAT, Index (BADG, One))
                        }
                        Else
                        {
                            If (LEqual (T_0, 0x03))
                            {
                                Store (^^LPC.EC0.BRTS, Index (BADG, 0x02))
                            }
                            Else
                            {
                                If (LEqual (T_0, 0x08))
                                {
                                    Store (One, Index (BADG, 0x07))
                                }
                                Else
                                {
                                    If (LEqual (T_0, 0x09))
                                    {
                                        Store (0x00020000, Index (BADG, 0x08))
                                    }
                                    Else
                                    {
                                        If (LEqual (T_0, 0x0A))
                                        {
                                            Store (0x00020000, Index (BADG, 0x09))
                                        }
                                        Else
                                        {
                                            If (LEqual (T_0, 0x0C))
                                            {
                                                Store (^^LPC.EC0.LANC, Index (BADG, 0x0B))
                                            }
                                            Else
                                            {
                                                If (LEqual (T_0, 0x0D))
                                                {
                                                    Store (^^LPC.EC0.LCDS, Index (BADG, 0x0C))
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Method (WSDS, 2, Serialized)
                {
                    Store (Arg1, BUFF)
                    Store (Arg0, Local0)
                    Store (BF00, Local1)
                    Store (Zero, Index (BADG, Subtract (Local0, One)))
                    Name (T_0, Zero)
                    Store (Local1, T_0)
                    If (LEqual (T_0, Zero))
                    {
                        Name (T_1, Zero)
                        Store (Local0, T_1)
                        If (LEqual (T_1, 0x04))
                        {
                            Store (Zero, ^^LPC.EC0.WLAT)
                        }
                        Else
                        {
                            If (LEqual (T_1, 0x05))
                            {
                                Store (Zero, ^^LPC.EC0.BTAT)
                            }
                            Else
                            {
                                If (LEqual (T_1, 0x06))
                                {
                                    Store (Zero, ^^LPC.EC0.BRTS)
                                }
                                Else
                                {
                                    If (LEqual (T_1, 0x07))
                                    {
                                        Store (Zero, BAEF)
                                    }
                                    Else
                                    {
                                        If (LEqual (T_1, 0x0B))
                                        {
                                            Store (0x0100, BAEF)
                                        }
                                        Else
                                        {
                                            Store (0x0100, Index (BADG, Subtract (Local0, One)))
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Else
                    {
                        Name (T_2, Zero)
                        Store (Local0, T_2)
                        If (LEqual (T_2, 0x04))
                        {
                            Store (One, ^^LPC.EC0.WLAT)
                        }
                        Else
                        {
                            If (LEqual (T_2, 0x05))
                            {
                                Store (One, ^^LPC.EC0.BTAT)
                            }
                            Else
                            {
                                If (LEqual (T_2, 0x06))
                                {
                                    Store (Local1, ^^LPC.EC0.BRTS)
                                }
                                Else
                                {
                                    If (LEqual (T_2, 0x07))
                                    {
                                        Store (One, BAEF)
                                    }
                                    Else
                                    {
                                        Store (0x0100, Index (BADG, Subtract (Local0, One)))
                                    }
                                }
                            }
                        }
                    }
                }

                Method (OEMN, 0, NotSerialized)
                {
                    If (LEqual (BGEF, One))
                    {
                        Store (NTDV, Local0)
                        If (LNotEqual (Local0, Zero))
                        {
                            Store (Zero, NTDV)
                            Return (Local0)
                        }
                    }

                    If (LEqual (BAEF, One))
                    {
                        Store (NTDC, Local0)
                        If (LNotEqual (Local0, Zero))
                        {
                            Store (Zero, NTDC)
                            Return (Local0)
                        }
                    }

                    If (LEqual (BFEF, One)) {}
                
		  Return (Local0)
		}

                Method (STRL, 2, Serialized)
                {
                    Store (Arg0, Local0)
                    Store (Arg1, BUFF)
                    Store (Zero, BBSB)
                    Name (T_0, Zero)
                    Store (Local0, T_0)
                    If (LEqual (T_0, One))
                    {
                        Store (^^LPC.EC0.THRO (Zero), Local1)
                        If (And (Local1, One))
                        {
                            Store (^^LPC.EC0.THRO (One), Local1)
                            Store (Local1, BBSB)
                        }
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x02))
                        {
                            Store (BF00, Local1)
                            ^^LPC.EC0.CLCK (Local1)
                        }
                        Else
                        {
                            Store (0x00010000, BBSB)
                        }
                    }
                }

                Method (WODP, 2, Serialized)
                {
                    Name (T_0, Zero)
                    Store (Arg0, T_0)
                    If (LEqual (T_0, 0x03))
                    {
                        Store (^^LPC.EC0.LANC, Index (BCDS, Subtract (Arg0, One)))
                    }
                    Else
                    {
                        If (LNotEqual (Match (Package (0x08)
                                        {
                                            One, 
                                            0x02, 
                                            0x04, 
                                            0x05, 
                                            0x06, 
                                            0x07, 
                                            0x08, 
                                            0x09
                                        }, MEQ, T_0, MTR, Zero, Zero), Ones))
                        {
                            Store (One, Index (BCDS, Subtract (Arg0, One)))
                        }
                        Else
                        {
                            If (LEqual (T_0, 0x0C))
                            {
                                If (Arg1)
                                {
                                    Store (One, ^^LPC.EC0.LANC)
                                }
                                Else
                                {
                                    Store (Zero, ^^LPC.EC0.LANC)
                                }

                                Store (Zero, Index (BCDS, Subtract (Arg0, 0x0A)))
                            }
                            Else
                            {
                                Store (One, Index (BCDS, Subtract (Arg0, One)))
                            }
                        }
                    }
                }

                Method (GCPU, 1, NotSerialized)
                {
                    Store (DSY5, DSY0)
                    Store (Arg0, Local0)
                    Store (IHWM (Zero, Arg0), Local2)
                    Store (Local2, DSY6)
                    Store (DY60, DY00)
                    Store (DY61, DY01)
                    Store (DY62, DY02)
                    Store (DY63, DY03)
                }

                Method (MSRR, 1, NotSerialized)
                {
                    Store (DSY3, DSY1)
                    Store (Arg0, DY00)
                    Store (IHWM (One, Arg0), Local2)
                    Store (Local2, DSY6)
                    Store (DY60, DY10)
                    Store (DY61, DY11)
                    Store (Zero, WIT0)
                    Store (WIT0, DY12)
                }

                Method (MSRW, 1, NotSerialized)
                {
                    Store (DSY3, DSY1)
                    Store (IHWM (0x02, Arg0), Local2)
                    Store (Local2, DSY6)
                    Store (DY60, DY10)
                    Store (DY61, DY11)
                    Store (Zero, WIT0)
                    Store (WIT0, DY12)
                }

                Method (C4C3, 2, NotSerialized)
                {
                    Store (Arg1, BUFF)
                    Store (BF00, Local1)
                    If (LEqual (Arg0, 0x04))
                    {
                        GCPU (0x05)
                        Store (DY00, BUFF)
                        If (And (BF02, 0x03))
                        {
                            Store (Local1, ^^LPC.C4O3)
                            Store (Local1, Index (BCDS, 0x09))
                        }
                        Else
                        {
                            Store (0x00010000, Index (BCDS, 0x09))
                        }
                    }
                    Else
                    {
                        Store (^^LPC.C4O3, Index (BCDS, 0x09))
                    }
                }

                Method (CPUF, 0, NotSerialized)
                {
                    Store (^^LPC.EC0.THFN, Local0)
                    Multiply (Local0, 0x64, Local1)
                    Store (Local1, Index (BCDS, 0x0A))
                }

                Method (CPUT, 0, NotSerialized)
                {
                    Store (^^LPC.EC0.CTMP, Index (BCDS, 0x0B))
                }

                Method (PCIR, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (IHWM (0x03, Arg0), Local2)
                    Store (Local2, DY20)
                    Store (Local2, DSY6)
                    Store (DSY4, DSY2)
                    Store (DY60, DY20)
                }

                Method (PCIW, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (Arg0, DY20)
                    Store (IHWM (0x04, Arg0), Local2)
                    Store (Local2, DSY6)
                    Store (DY61, BUFF)
                }

                Method (CPUS, 0, NotSerialized)
                {
                    Store (IHWM (0x05, Zero), Local2)
                    Store (Local2, BUFF)
                    Store (BUFF, Index (BCDS, 0x0C))
                }

                Method (PCID, 1, NotSerialized)
                {
                    Store (IHWM (0x06, Arg0), Local2)
                    Store (Local2, DSY6)
                }

                Method (BTIF, 2, Serialized)
                {
                    Store (Arg0, Local0)
                    Store (Arg1, BUFF)
                    If (LEqual (Local0, 0x13))
                    {
                        Store (BF00, Local1)
                        Store (BF04, BF00)
                        Store (Local1, BF04)
                    }

                    If (LEqual (Local0, 0x0D))
                    {
                        Store (BF02, BF00)
                        Store (BF01, Local1)
                        Store (BF02, BF00)
                        Store (BF01, Local1)
                    }

                    If (LEqual (Local0, 0x0E))
                    {
                        If (LEqual (BF00, Zero))
                        {
                            Store (0xFF, BF00)
                        }
                        Else
                        {
                            Store (BF00, Local1)
                            Store (One, BF00)
                        }
                    }

                    Name (T_0, Zero)
                    Store (BF00, T_0)
                    If (LEqual (T_0, One))
                    {
                        If (LEqual (^^LPC.EC0.BDC0, Zero))
                        {
                            Store (0x00020000, Local1)
                            Decrement (Local0)
                            Store (Local1, Index (BEDS, Local0))
                        }
                        Else
                        {
                            Name (T_1, Zero)
                            Store (Local0, T_1)
                            If (LEqual (T_1, One))
                            {
                                Store (Zero, Index (BEDS, Zero))
                            }
                            Else
                            {
                                If (LEqual (T_1, 0x02))
                                {
                                    Store (^^LPC.EC0.BPTC, Index (BEDS, One))
                                }
                                Else
                                {
                                    If (LEqual (T_1, 0x03))
                                    {
                                        Store (^^LPC.EC0.BPV0, Index (BEDS, 0x02))
                                    }
                                    Else
                                    {
                                        If (LEqual (T_1, 0x04))
                                        {
                                            Store (^^LPC.EC0.BSCU, Index (BEDS, 0x03))
                                        }
                                        Else
                                        {
                                            If (LEqual (T_1, 0x05))
                                            {
                                                Store (^^LPC.EC0.BRC0, Index (BEDS, 0x04))
                                            }
                                            Else
                                            {
                                                If (LEqual (T_1, 0x06))
                                                {
                                                    Store (^^LPC.EC0.BFC0, Index (BEDS, 0x05))
                                                }
                                                Else
                                                {
                                                    If (LEqual (T_1, 0x07))
                                                    {
                                                        Store (^^LPC.EC0.BSCY, Index (BEDS, 0x06))
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (T_1, 0x08))
                                                        {
                                                            Store (^^LPC.EC0.BDC0, Index (BEDS, 0x07))
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (T_1, 0x09))
                                                            {
                                                                Store (^^LPC.EC0.BDV0, Index (BEDS, 0x08))
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (T_1, 0x0A))
                                                                {
                                                                    Store (^^LPC.EC0.BDAD, Index (BEDS, 0x09))
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (T_1, 0x0B))
                                                                    {
                                                                        Store (^^LPC.EC0.BSN0, Index (BEDS, 0x0A))
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (T_1, 0x0C))
                                                                        {
                                                                            If (LEqual (^^LPC.EC0.ACIS, One))
                                                                            {
                                                                                Store (Zero, ^^LPC.EC0.PSRC)
                                                                                Store (One, Index (BEDS, 0x0B))
                                                                            }
                                                                            Else
                                                                            {
                                                                                Store (0x00020000, Index (BEDS, 0x0B))
                                                                            }
                                                                        }
                                                                        Else
                                                                        {
                                                                            If (LEqual (T_1, 0x0D))
                                                                            {
                                                                                Store (Local1, ^^LPC.EC0.BTMA)
                                                                                Store (One, ^^LPC.EC0.SCCF)
                                                                                Store (One, Index (BEDS, 0x0C))
                                                                            }
                                                                            Else
                                                                            {
                                                                                If (LEqual (T_1, 0x0E))
                                                                                {
                                                                                    Store (Local1, ^^LPC.EC0.BTPV)
                                                                                    Store (Zero, ^^LPC.EC0.SCHG)
                                                                                    Store (One, ^^LPC.EC0.SCPF)
                                                                                    Store (One, Index (BEDS, 0x0D))
                                                                                }
                                                                                Else
                                                                                {
                                                                                    If (LEqual (T_1, 0x0F))
                                                                                    {
                                                                                        Store (^^LPC.EC0.BDFC, Index (BEDS, 0x0E))
                                                                                    }
                                                                                    Else
                                                                                    {
                                                                                        If (LEqual (T_1, 0x10))
                                                                                        {
                                                                                            Store (^^LPC.EC0.BDME, Index (BEDS, 0x0F))
                                                                                        }
                                                                                        Else
                                                                                        {
                                                                                            If (LEqual (T_1, 0x11))
                                                                                            {
                                                                                                If (And (One, ^^LPC.EC0.ADPT))
                                                                                                {
                                                                                                    Store (0x02BC, Index (BEDS, 0x10))
                                                                                                }
                                                                                                Else
                                                                                                {
                                                                                                    Store (0x0190, Index (BEDS, 0x10))
                                                                                                }
                                                                                            }
                                                                                            Else
                                                                                            {
                                                                                                If (LEqual (T_1, 0x12))
                                                                                                {
                                                                                                    If (And (One, ^^LPC.EC0.ADPT))
                                                                                                    {
                                                                                                        Store (0x01F4, Index (BEDS, 0x11))
                                                                                                    }
                                                                                                    Else
                                                                                                    {
                                                                                                        Store (0x02, Index (BEDS, 0x11))
                                                                                                    }
                                                                                                }
                                                                                                Else
                                                                                                {
                                                                                                    If (LEqual (T_1, 0x13))
                                                                                                    {
                                                                                                        Name (T_2, Zero)
                                                                                                        Store (BF04, T_2)
                                                                                                        If (LEqual (T_2, 0x03))
                                                                                                        {
                                                                                                            Store (^^LPC.EC0.BATM, Index (BEDS, 0x12))
                                                                                                        }
                                                                                                        Else
                                                                                                        {
                                                                                                            If (LEqual (T_2, 0x08))
                                                                                                            {
                                                                                                                Store (^^LPC.EC0.BTTC, Local0)
                                                                                                                Add (Local0, 0x0111, Local0)
                                                                                                                Multiply (Local0, 0x0A, Local0)
                                                                                                                Store (Local0, Index (BEDS, 0x12))
                                                                                                            }
                                                                                                            Else
                                                                                                            {
                                                                                                                If (LEqual (T_2, 0x09))
                                                                                                                {
                                                                                                                    Store (^^LPC.EC0.BPV0, Index (BEDS, 0x12))
                                                                                                                }
                                                                                                                Else
                                                                                                                {
                                                                                                                    If (LEqual (T_2, 0x0A))
                                                                                                                    {
                                                                                                                        Store (^^LPC.EC0.BSCU, Index (BEDS, 0x12))
                                                                                                                    }
                                                                                                                    Else
                                                                                                                    {
                                                                                                                        If (LEqual (T_2, 0x0F))
                                                                                                                        {
                                                                                                                            Store (^^LPC.EC0.BRC0, Index (BEDS, 0x12))
                                                                                                                        }
                                                                                                                        Else
                                                                                                                        {
                                                                                                                            If (LEqual (T_2, 0x17))
                                                                                                                            {
                                                                                                                                Store (^^LPC.EC0.BSCY, Index (BEDS, 0x12))
                                                                                                                            }
                                                                                                                            Else
                                                                                                                            {
                                                                                                                                If (LEqual (T_2, 0x18))
                                                                                                                                {
                                                                                                                                    Store (^^LPC.EC0.BDC0, Index (BEDS, 0x12))
                                                                                                                                }
                                                                                                                                Else
                                                                                                                                {
                                                                                                                                    If (LEqual (T_2, 0x19))
                                                                                                                                    {
                                                                                                                                        Store (^^LPC.EC0.BDV0, Index (BEDS, 0x12))
                                                                                                                                    }
                                                                                                                                    Else
                                                                                                                                    {
                                                                                                                                        If (LEqual (T_2, 0x1B))
                                                                                                                                        {
                                                                                                                                            Store (^^LPC.EC0.BDAD, Index (BEDS, 0x12))
                                                                                                                                        }
                                                                                                                                        Else
                                                                                                                                        {
                                                                                                                                            If (LEqual (T_2, 0x1C))
                                                                                                                                            {
                                                                                                                                                Store (^^LPC.EC0.BSN0, Index (BEDS, 0x12))
                                                                                                                                            }
                                                                                                                                            Else
                                                                                                                                            {
                                                                                                                                            }
                                                                                                                                        }
                                                                                                                                    }
                                                                                                                                }
                                                                                                                            }
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                    Else
                                                                                                    {
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Else
                    {
                        Name (T_3, Zero)
                        Store (Local0, T_3)
                        If (LEqual (T_3, One))
                        {
                            Store (0x00020000, Index (BEDS, Zero))
                        }
                        Else
                        {
                            If (LEqual (T_3, 0x02))
                            {
                                Store (0x00020000, Index (BEDS, One))
                            }
                            Else
                            {
                                If (LEqual (T_3, 0x03))
                                {
                                    Store (0x00020000, Index (BEDS, 0x02))
                                }
                                Else
                                {
                                    If (LEqual (T_3, 0x04))
                                    {
                                        Store (0x00020000, Index (BEDS, 0x03))
                                    }
                                    Else
                                    {
                                        If (LEqual (T_3, 0x05))
                                        {
                                            Store (0x00020000, Index (BEDS, 0x04))
                                        }
                                        Else
                                        {
                                            If (LEqual (T_3, 0x06))
                                            {
                                                Store (0x00020000, Index (BEDS, 0x05))
                                            }
                                            Else
                                            {
                                                If (LEqual (T_3, 0x07))
                                                {
                                                    Store (0x00020000, Index (BEDS, 0x06))
                                                }
                                                Else
                                                {
                                                    If (LEqual (T_3, 0x08))
                                                    {
                                                        Store (0x00020000, Index (BEDS, 0x07))
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (T_3, 0x09))
                                                        {
                                                            Store (0x00020000, Index (BEDS, 0x08))
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (T_3, 0x0A))
                                                            {
                                                                Store (0x00020000, Index (BEDS, 0x09))
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (T_3, 0x0B))
                                                                {
                                                                    Store (0x00020000, Index (BEDS, 0x0A))
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (T_3, 0x0C))
                                                                    {
                                                                        If (LEqual (^^LPC.EC0.BDC0, Zero))
                                                                        {
                                                                            Store (0x00030000, Index (BEDS, 0x0B))
                                                                        }
                                                                        Else
                                                                        {
                                                                            Store (One, ^^LPC.EC0.PSRC)
                                                                            Store (One, Index (BEDS, 0x0B))
                                                                        }
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (T_3, 0x0D))
                                                                        {
                                                                            Store (0x00020000, Index (BEDS, 0x0C))
                                                                        }
                                                                        Else
                                                                        {
                                                                            If (LEqual (T_3, 0x0E))
                                                                            {
                                                                                Store (One, ^^LPC.EC0.SCHG)
                                                                                Store (One, ^^LPC.EC0.SCPF)
                                                                                Store (One, Index (BEDS, 0x0D))
                                                                            }
                                                                            Else
                                                                            {
                                                                                If (LEqual (T_3, 0x0F))
                                                                                {
                                                                                    Store (0x00020000, Index (BEDS, 0x0E))
                                                                                }
                                                                                Else
                                                                                {
                                                                                    If (LEqual (T_3, 0x10))
                                                                                    {
                                                                                        Store (0x00020000, Index (BEDS, 0x0F))
                                                                                    }
                                                                                    Else
                                                                                    {
                                                                                        If (LEqual (T_3, 0x11))
                                                                                        {
                                                                                            If (And (One, ^^LPC.EC0.ADPT))
                                                                                            {
                                                                                                Store (0x02BC, Index (BEDS, 0x10))
                                                                                            }
                                                                                            Else
                                                                                            {
                                                                                                Store (0x0190, Index (BEDS, 0x10))
                                                                                            }
                                                                                        }
                                                                                        Else
                                                                                        {
                                                                                            If (LEqual (T_3, 0x12))
                                                                                            {
                                                                                                If (And (One, ^^LPC.EC0.ADPT))
                                                                                                {
                                                                                                    Store (0x01F4, Index (BEDS, 0x11))
                                                                                                }
                                                                                                Else
                                                                                                {
                                                                                                    Store (0x02, Index (BEDS, 0x11))
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Method (CKGS, 0, NotSerialized)
                {
                    Store (One, GSTS)
                    Return (GSTS)
                }

                Method (WSHP, 1, NotSerialized)
                {
                }

                Method (WSSL, 1, NotSerialized)
                {
                }

                Method (WSSP, 1, NotSerialized)
                {
                }

                Method (WSSE, 1, NotSerialized)
                {
                }

                Method (WSVE, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    If (LEqual (Local0, One))
                    {
                        Store (One, BGEF)
                    }
                    Else
                    {
                        Store (Zero, BGEF)
                    }

                    Store (Zero, Index (BGDS, Zero))
                }

                Name (_WDG, Buffer (0xDC)
                {
                    /* 0000 */   0x09, 0x4E, 0x76, 0x95, 0x56, 0xFB, 0x83, 0x4E,
                    /* 0008 */   0xB3, 0x1A, 0x37, 0x76, 0x1F, 0x60, 0x99, 0x4A,
                    /* 0010 */   0x41, 0x41, 0x01, 0x01, 0x58, 0xF2, 0xF4, 0x6A,
                    /* 0018 */   0x01, 0xB4, 0xFD, 0x42, 0xBE, 0x91, 0x3D, 0x4A,
                    /* 0020 */   0xC2, 0xD7, 0xC0, 0xD3, 0x42, 0x41, 0x01, 0x02,
                    /* 0028 */   0xAC, 0x61, 0x1A, 0xCC, 0x56, 0x42, 0xA3, 0x41,
                    /* 0030 */   0xB9, 0xE0, 0x05, 0xA4, 0x45, 0xAD, 0xE2, 0xF5,
                    /* 0038 */   0x80, 0x00, 0x01, 0x08, 0x53, 0x44, 0x8C, 0xE7,
                    /* 0040 */   0x27, 0x02, 0x61, 0x48, 0x9E, 0xDE, 0xF5, 0x60,
                    /* 0048 */   0x0B, 0x4A, 0x3D, 0x39, 0x42, 0x42, 0x01, 0x02,
                    /* 0050 */   0x7B, 0x4F, 0xE0, 0xAA, 0xC5, 0xB3, 0x65, 0x48,
                    /* 0058 */   0x95, 0xD6, 0x9F, 0xAC, 0x7F, 0xF3, 0xE9, 0x2B,
                    /* 0060 */   0x42, 0x43, 0x01, 0x02, 0x79, 0x4C, 0xF9, 0xCF,
                    /* 0068 */   0x77, 0x6C, 0xF7, 0x4A, 0xAC, 0x56, 0x7D, 0xD0,
                    /* 0070 */   0xCE, 0x01, 0xC9, 0x97, 0x42, 0x44, 0x01, 0x02,
                    /* 0078 */   0xC5, 0x2E, 0x77, 0x79, 0xB1, 0x04, 0xFD, 0x4B,
                    /* 0080 */   0x84, 0x3C, 0x61, 0xE7, 0xF7, 0x7B, 0x6C, 0xC9,
                    /* 0088 */   0x42, 0x45, 0x01, 0x02, 0xB7, 0xA0, 0xC9, 0xA7,
                    /* 0090 */   0x9D, 0x4C, 0x72, 0x4C, 0x83, 0xBB, 0x53, 0xA3,
                    /* 0098 */   0x45, 0x91, 0x71, 0xDF, 0x42, 0x46, 0x01, 0x02,
                    /* 00A0 */   0x4F, 0x06, 0x3A, 0x65, 0x3A, 0xA2, 0x5F, 0x48,
                    /* 00A8 */   0xB3, 0xD9, 0x13, 0xF6, 0x53, 0x2A, 0x01, 0x82,
                    /* 00B0 */   0x42, 0x47, 0x01, 0x02, 0xA7, 0xB1, 0x85, 0xDB,
                    /* 00B8 */   0x9A, 0x06, 0xBB, 0x4A, 0xA2, 0xB5, 0xD1, 0x86,
                    /* 00C0 */   0xA2, 0x1B, 0x80, 0xF1, 0x81, 0x00, 0x01, 0x08,
                    /* 00C8 */   0x91, 0x6B, 0x91, 0x36, 0x64, 0x1A, 0x83, 0x45,
                    /* 00D0 */   0x84, 0xD0, 0x53, 0x83, 0x0F, 0xB9, 0x10, 0x8D,
                    /* 00D8 */   0x82, 0x00, 0x01, 0x08
                })
                Method (WQAA, 1, NotSerialized)
                {
                    AAF1 ()
                    Store (AADS, BUFF)
                    Return (BUFF)
                }

                Method (WMBA, 3, Serialized)
                {
                    Name (T_0, Zero)
                    Store (Arg1, T_0)
                    If (LNotEqual (Match (Package (0x08)
                                    {
                                        One, 
                                        0x02, 
                                        0x03, 
                                        0x08, 
                                        0x09, 
                                        0x0A, 
                                        0x0C, 
                                        0x0D
                                    }, MEQ, T_0, MTR, Zero, Zero), Ones))
                    {
                        Store (Zero, Local0)
                    }
                    Else
                    {
                        If (LNotEqual (Match (Package (0x05)
                                        {
                                            0x04, 
                                            0x05, 
                                            0x06, 
                                            0x07, 
                                            0x0B
                                        }, MEQ, T_0, MTR, Zero, Zero), Ones))
                        {
                            If (LEqual (Arg1, 0x07))
                            {
                                Store (Arg2, BUFF)
                                If (BF00)
                                {
                                    Store (One, BAEF)
                                }
                            }

                            Store (One, Local0)
                        }
                    }

                    If (Local0)
                    {
                        WSDS (Arg1, Arg2)
                    }
                    Else
                    {
                        WGDS (Arg1)
                    }

                    Store (DerefOf (Index (BADG, Subtract (Arg1, One))), BUFF)
                    Return (BUFF)
                }

                Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event
                {
                    If (LGreaterEqual (Arg0, 0x80))
                    {
                        If (LLess (Arg0, 0x83))
                        {
                            Return (OEMN ())
                        }
                    }
                    Return (Zero)
                }

                Method (WMBB, 3, NotSerialized)
                {
                    STRL (Arg1, Arg2)
                    If (LEqual (Arg1, One))
                    {
                        Store (BBSB, BUFF)
                    }

                    If (LEqual (Arg1, 0x02))
                    {
                        Store (BBD1, BUFF)
                    }

                    Return (BUFF)
                }

                Method (WMBC, 3, NotSerialized)
                {
                    WODP (Arg1, Arg2)
                    If (LLess (Arg1, 0x0A))
                    {
                        Subtract (Arg1, One, Local0)
                        Store (DerefOf (Index (BCDS, Subtract (Arg1, One))), BUFF)
                    }
                    Else
                    {
                        ShiftRight (DerefOf (Index (BCDS, Subtract (Arg1, 0x0A))), 0x10, 
                            BUFF)
                    }

                    Return (BUFF)
                }

                Method (WMBD, 3, NotSerialized)
                {
                    If (LEqual (Arg1, One))
                    {
                        Store (Arg2, BUFF)
                        Store (BUFF, Local0)
                        Store (Arg2, WIT0)
                        GCPU (WIT0)
                        Return (DSY0)
                    }

                    If (LEqual (Arg1, 0x02))
                    {
                        Store (Arg2, Local0)
                        MSRR (Arg2)
                        Return (DSY1)
                    }

                    If (LEqual (Arg1, 0x03))
                    {
                        Store (Arg2, Local0)
                        MSRW (Arg2)
                        Return (DSY1)
                    }

                    If (LEqual (Arg1, 0x04))
                    {
                        C4C3 (Arg1, Arg2)
                        ShiftRight (DerefOf (Index (BCDS, Add (Arg1, 0x05))), 0x10, 
                            BUFF)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x05))
                    {
                        C4C3 (Arg1, Arg2)
                        Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x06))
                    {
                        CPUF ()
                        Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x07))
                    {
                        CPUT ()
                        Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x08))
                    {
                        Store (Arg2, WPRW)
                        Store (WWD1, WPIR)
                        Store (WWD2, WPIF)
                        Store (WWD3, WPID)
                        Store (WWD4, WPIB)
                        Concatenate (WPCI, WWD0, Local0)
                        PCIR (Local0)
                        Return (DSY2)
                    }

                    If (LEqual (Arg1, 0x09))
                    {
                        Store (Arg2, DSY6)
                        Store (DY60, Local0)
                        Store (Arg2, DSY0)
                        Store (DY01, WPRW)
                        Store (WWD1, WPIR)
                        Store (WWD2, WPIF)
                        Store (WWD3, WPID)
                        Store (WWD4, WPIB)
                        Store (WPCI, Local1)
                        Concatenate (DY60, WPCI, Local0)
                        Concatenate (Local0, WWD0, Local1)
                        PCIW (Local1)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x0A))
                    {
                        CPUS ()
                        Store (DerefOf (Index (BCDS, Add (Arg1, 0x02))), BUFF)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x0B))
                    {
                        PCID (Arg2)
                        Return (DSY6)
                    }
                    Return (Zero)
                }

                Method (WMBE, 3, NotSerialized)
                {
                    BTIF (Arg1, Arg2)
                    Store (DerefOf (Index (BEDS, Subtract (Arg1, One))), BUFF)
                    Return (BUFF)
                }

                Method (WMBF, 3, NotSerialized)
                {
                    If (LGreater (Arg1, 0x04))
                    {
                        Store (0x02, BF00)
                        Store (Zero, BF01)
                        Store (Zero, BF02)
                        Store (Zero, BF03)
                        Return (BUFF)
                    }

                    If (CKGS ())
                    {
                        Store (Arg2, BUFF)
                        If (LEqual (Arg1, One))
                        {
                            WSHP (BF00)
                        }
                        Else
                        {
                            If (LEqual (Arg1, 0x02))
                            {
                                WSSL (BF00)
                            }
                            Else
                            {
                                If (LEqual (Arg1, 0x03))
                                {
                                    WSSP (BF00)
                                }
                                Else
                                {
                                    WSSE (BF00)
                                }
                            }
                        }

                        Store (DerefOf (Index (BFDS, Subtract (Arg1, One))), BUFF)
                        Store (BUFF, Debug)
                    }
                    Else
                    {
                        Store (0x03, BF00)
                        Store (Zero, BF01)
                        Store (Zero, BF02)
                        Store (Zero, BF03)
                    }

                    Return (BUFF)
                }

                Method (WMBG, 3, NotSerialized)
                {
                    Store (Arg2, BUFF)
                    WSVE (BF00)
                    Store (DerefOf (Index (BGDS, Subtract (Arg1, One))), BUFF)
                    Store (BUFF, Debug)
                    Return (BUFF)
                }
            }

            Device (AZAL)
            {
                Name (_ADR, 0x001B0000)  // _ADR: Address
                OperationRegion (HDCS, PCI_Config, 0x54, 0x04)
                Field (HDCS, DWordAcc, NoLock, Preserve)
                {
                        ,   15, 
                    PMES,   1
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If (LEqual (WKMD, One))
                    {
                        Return (Package (0x02)
                        {
                            0x0D, 
                            0x03
                        })
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            0x0D, 
                            Zero
                        })
                    }
                }
            }
        }
    }
}

