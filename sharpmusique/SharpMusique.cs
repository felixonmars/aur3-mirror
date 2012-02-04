/*****************************************************************************
 * SharpMusique.cs: SharpMusique 1.0
 *****************************************************************************
 * Copyright (C) 2005 Jon Lech Johansen <jon@nanocrew.net>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111, USA.
 *****************************************************************************/

using System;
using System.IO;
using System.Net;
using System.Threading;
using System.Reflection;
using System.Collections;
using System.Collections.Specialized;
using System.Security.Cryptography.X509Certificates;

using GLib;
using Gtk;
using Glade;

class TrustAllCertificatesPolicy : System.Net.ICertificatePolicy
{
    public TrustAllCertificatesPolicy()
    {

    }

    public bool CheckValidationResult( ServicePoint sp, X509Certificate cert,
                                       WebRequest req, int problem )
    {
        return true;
    }
}

class SharpMusique
{
    public static void Main( string [] args )
    {
        try
        {
            new SharpMusique( args );
        }
        catch( Exception e )
        {
            string strFileName = Path.Combine( Path.GetTempPath(),
                Guid.NewGuid().ToString() + ".html" );

            StreamWriter sw = new StreamWriter( strFileName );
            sw.Write( e.Message + Environment.NewLine + e.StackTrace );
            sw.Close();

            System.Diagnostics.Process.Start( strFileName );
        }
    }

    [Widget] private Window MainWindow;
    [Widget] private Entry searchentry;
    [Widget] private TreeView songtv;
    [Widget] private MenuItem micountry;
    [Widget] private MenuItem mipending;
    [Widget] private MenuItem mipepsicap;
    [Widget] private MenuItem migiftcert;
    [Widget] private MenuItem mipreview;
    [Widget] private MenuItem mipurchase;
    [Widget] private MenuItem mipurchasealbum;
    [Widget] private MenuItem miviewalbum;
    [Widget] private Statusbar sbar;

    private Dialog prefsdlg;
    private Entry songdirentry;

    private object signupdata;

    private string strHomeDir;
    private string strSongDir;
    private string strDataDir;
    private string strCountry;

    private FairStore fstore;
    private ArrayList songs;
    private ListStore songls;

    private uint cidStatus;
    private uint cidProgress;

    private Mutex mutex;

    private VLC vlc;

    private FairStore Store
    {
        get
        {
            if( fstore == null )
            {
                fstore = new FairStore();

                try
                {
                    string strURL = "https://phobos.apple.com";
                    WebRequest.Create( strURL ).GetResponse();
                }
                catch( Exception )
                {
                    System.Net.ServicePointManager.CertificatePolicy =
                        new TrustAllCertificatesPolicy();
                }
            }

            fstore.Country = strCountry;

            return fstore;
        }
    }

    private SharpMusique( string [] args )
    {
        int i;
        string strPath;
        TreeViewColumn tvc;
        CellRenderer rendr;

        string [] strColumns = new string[]
        {
            "Title", "Artist", "Album", "Time", "Price"
        };

        string [] strCWidths = new string[]
        {
            "260", "190", "180", "70", "70"
        };

        if( Environment.OSVersion.ToString().IndexOf( "Unix" ) != -1 )
        {
            strHomeDir = Environment.GetEnvironmentVariable( "HOME" );
            strSongDir = Path.Combine( strHomeDir, "Music" );
            strDataDir = Path.Combine( strHomeDir, ".SharpMusique" );
        }
        else
        {
            strHomeDir = Environment.GetFolderPath(
                Environment.SpecialFolder.ApplicationData );
            strSongDir = Environment.GetFolderPath(
                Environment.SpecialFolder.MyMusic );
            strDataDir = Path.Combine( strHomeDir, "SharpMusique" );
        }

        Utility.CreateDirectory( strDataDir );

        strPath = Path.Combine( strDataDir, "songdir" );
        if( File.Exists( strPath ) )
        {
            StreamReader sr = new StreamReader( strPath );
            strSongDir = sr.ReadToEnd().Trim();
            sr.Close();
        }

        Utility.CreateDirectory( strSongDir );

        strPath = Path.Combine( strDataDir, "cwidths" );
        if( File.Exists( strPath ) )
        {
            StreamReader sr = new StreamReader( strPath );
            string [] strTmp = sr.ReadToEnd().Split( ',' );
            sr.Close();

            if( strTmp.Length == strCWidths.Length )
                strCWidths = strTmp;
        }

        Application.Init();

        Glade.XML gxml = new Glade.XML( null, "SharpMusique.glade",
                                        "MainWindow", null );
        gxml.Autoconnect( this );

        MainWindow.Icon = new Gdk.Pixbuf( null, "sharpmusique.png" );

        songls = new ListStore( GType.String, GType.String, GType.String,
                                GType.String, GType.String, GType.Int );

        songtv.Model = songls;
        songtv.HeadersClickable = true;
        songtv.Selection.Changed += new EventHandler( OnTreeViewSelection );

        for( i = 0; i < strColumns.Length; i++ )
        {
            tvc = new TreeViewColumn();
            rendr = new CellRendererText();
            tvc.Title = strColumns[ i ];
            tvc.PackStart( rendr, true );
            tvc.AddAttribute( rendr, "text", i );
            tvc.Sizing = TreeViewColumnSizing.Fixed;
            tvc.FixedWidth = Convert.ToInt32( strCWidths[ i ] );
            tvc.Resizable = true;
            tvc.SortColumnId = i;
            songtv.AppendColumn( tvc );
        }

        strPath = Path.Combine( strDataDir, "country" );
        if( File.Exists( strPath ) )
        {
            StreamReader sr = new StreamReader( strPath );
            strCountry = sr.ReadToEnd().Trim();
            sr.Close();
        }

        SList group = new SList( IntPtr.Zero );
        Menu cmenu = new Menu();
        micountry.Submenu = cmenu;
        string [] countries = FairStore.Countries.AllKeys;
        for( i = 0; i < countries.Length; i++ )
        {
            RadioMenuItem rmi = new RadioMenuItem( group, countries[ i ] );
            rmi.Toggled += new EventHandler( OnCountrySelect );
            rmi.Name = countries[ i ];
            if( (((i + 1) == countries.Length) && (strCountry == null)) ||
                countries[ i ].Equals( strCountry ) )
            {
                rmi.Active = true;
            }
            group = rmi.Group;
            cmenu.Append( rmi );
            rmi.Show();
        }

        mipending.Sensitive = false;
        mipepsicap.Sensitive = false;
        migiftcert.Sensitive = false;
        mipreview.Sensitive = false;
        mipurchase.Sensitive = false;
        mipurchasealbum.Sensitive = false;
        miviewalbum.Sensitive = false;

        cidStatus = sbar.GetContextId( "Status" );
        cidProgress = sbar.GetContextId( "Progress" );

        sbar.Push( cidStatus, "Not Logged In" );

        mutex = new Mutex();

        Application.Run();
    }

    private void OnWindowDeleteEvent( object o, DeleteEventArgs args )
    {
        OnQuit( o, (EventArgs)args );
        args.RetVal = true;
    }

    private void OnQuit( object o, EventArgs args )
    {
        string strPath;
        StreamWriter sw;

        string strCWidths = String.Empty;
        TreeViewColumn [] columns = songtv.Columns;
        for( int i = 0; i < columns.Length; i++ )
        {
            if( strCWidths != String.Empty )
                strCWidths += ",";
            strCWidths += columns[ i ].Width;
        }

        strPath = Path.Combine( strDataDir, "cwidths" );
        sw = new StreamWriter( strPath );
        sw.Write( strCWidths );
        sw.Close();

        strPath = Path.Combine( strDataDir, "songdir" );
        sw = new StreamWriter( strPath );
        sw.Write( strSongDir );
        sw.Close();

        Application.Quit();
    }

    private void OnPreferences( object o, EventArgs args )
    {
        if( prefsdlg == null )
        {
            Button btn;
            HBox split;
            VBox left, right;
            Button songdirbtn;

            prefsdlg = new Dialog();
            prefsdlg.Modal = true;
            prefsdlg.Title = "SharpMusique Preferences";
            prefsdlg.SetSizeRequest( 500, -1 );

            split = new HBox();
            prefsdlg.VBox.Add( split );
            left = new VBox( true, 0 );
            right = new VBox( true, 0 );
            split.PackStart( left, false, false, 5 );
            split.PackEnd( right, true, true, 10 );

            songdirbtn = new Button( "Song Folder: " );
            songdirbtn.Clicked += new EventHandler( OnSongDirSelected );

            songdirentry = new Entry();

            left.PackStart( songdirbtn, false, false, 10 );
            right.PackStart( songdirentry, false, false, 10 );

            btn = new Button( "Cancel" );
            prefsdlg.AddActionWidget( btn, ResponseType.Cancel );

            btn = new Button( "Save" );
            prefsdlg.AddActionWidget( btn, ResponseType.Ok );

            prefsdlg.Response += new ResponseHandler( OnPreferencesResponse );
        }

        songdirentry.Text = strSongDir;

        prefsdlg.TransientFor = this.MainWindow;
        prefsdlg.SetPosition( WindowPosition.CenterOnParent );

        prefsdlg.ShowAll();
        prefsdlg.Run();
    }

    private void OnSongDirSelected( object o, EventArgs args )
    {
        CompatFileChooserDialog fcdlg;
        fcdlg = new CompatFileChooserDialog( "Select Song Folder...", null,
            CompatFileChooserDialog.Action.SelectFolder );
        if( fcdlg.Run() == (int)ResponseType.Ok )
        {
            songdirentry.Text = fcdlg.Filename;
        }
        fcdlg.Destroy();
    }

    private void OnPreferencesResponse( object o, ResponseArgs args )
    {
        prefsdlg.Hide();

        if( args.ResponseId == ResponseType.Ok )
        {
            strSongDir = songdirentry.Text;
            Utility.CreateDirectory( strSongDir );
        }
    }

    private void OnCountrySelect( object o, EventArgs args )
    {
        RadioMenuItem mi = (RadioMenuItem)o;

        if( !mi.Active )
            return;

        strCountry = mi.Name;

        string strPath = Path.Combine( strDataDir, "country" );
        StreamWriter sw = new StreamWriter( strPath );
        sw.Write( strCountry );
        sw.Close();
    }

    private void OnLogin( object o, EventArgs args )
    {
        LoginDialog dlg = new LoginDialog( MainWindow );
        switch( (ResponseType)dlg.Run() )
        {
            case ResponseType.Ok:
                ThreadPool.QueueUserWorkItem( new WaitCallback(LoginThread),
                    new string [] { dlg.Username, dlg.Password } );
                break;

            default:
                break;
        }
        dlg.Destroy();
    }

    private void DoAlertBox( AlertType type, string message )
    {
        new AlertDialog( MainWindow, type, null, message );
    }

    private void LoginThread( object State )
    {
        string [] UserPass = (string [])State;

        try
        {
            Store.Login( UserPass[ 0 ], UserPass[ 1 ], 0 );
            RunOnMainThread.Run( this, "OnLoginStateChanged",
                new object[] { true } );
        }
        catch( Exception e )
        {
            RunOnMainThread.Run( this, "DoAlertBox",
                new object[] { AlertType.Error, e.Message } );
            RunOnMainThread.Run( this, "OnLoginStateChanged",
                new object[] { false } );
        }
    }

    private void DoStatusbarBalanceUpdate( object Dummy )
    {
        DoStatusbarUpdate( cidStatus, "Balance: " + Store.CreditDisplay, 3 );
    }

    private void OnLoginStateChanged( bool State )
    {
        if( State )
        {
            DoStatusbarBalanceUpdate( null );
        }
        else
        {
            DoStatusbarUpdate( cidStatus, "Not Logged In", 3 );
        }

        mipending.Sensitive = State;
        mipepsicap.Sensitive = State;
        migiftcert.Sensitive = State;

        DoSongMenuStateUpdate();
    }

    private void OnPendingSongs( object o, EventArgs args )
    {
        ThreadPool.QueueUserWorkItem( new WaitCallback(PendingSongsThread) );
    }

    private void PendingSongsThread( object State )
    {
        try
        {
            songs = Store.PendingSongs();
            RunOnMainThread.Run( this, "DoTreeViewUpdate",
                                 new object[] { null } );
        }
        catch( Exception e )
        {
            RunOnMainThread.Run( this, "DoAlertBox",
                new object[] { AlertType.Error, e.Message } );
        }
    }

    private void OnAbout( object o, EventArgs args )
    {
        AboutDialog.Show( MainWindow );
    }

    private void OnSearch( object o, EventArgs args )
    {
        ThreadPool.QueueUserWorkItem( new WaitCallback(SearchThread),
                                      searchentry.Text );
    }

    private void SearchThread( object State )
    {
        string strTerm = (string)State;

        try
        {
            songs = Store.Search( strTerm );
            RunOnMainThread.Run( this, "DoTreeViewUpdate",
                                 new object[] { null } );
        }
        catch( Exception e )
        {
            RunOnMainThread.Run( this, "DoAlertBox",
                new object[] { AlertType.Error, e.Message } );
        }
    }

    private void DoStatusbarUpdate( uint cid, string Message, int Flags )
    {
        if( (Flags & 1) == 1 )
            sbar.Pop( cid );
        if( (Flags & 2) == 2 )
            sbar.Push( cid, Message );
    }

    private string GetSongPrice( Hashtable song )
    {
        string strPrice;

        if( song[ "priceDisplay" ] != null )
        {
            strPrice = (string)song[ "priceDisplay" ];
        }
        else if( song[ "price" ] != null )
        {
            strPrice = String.Format( "{0:f}",
                Convert.ToDouble( song[ "price" ] ) / 1000 );
        }
        else
        {
            strPrice = "Album Only";
        }

        return strPrice;
    }

    private void DoTreeViewUpdate( object Dummy )
    {
        songls.Clear();
        DoSongMenuStateUpdate();

        int i = 0;
        foreach( Hashtable dict in songs )
        {
            string strTime;
            string strPrice;
            string strSongName;
            string strExplicit = String.Empty;

            Hashtable meta;

	    if( dict[ "metaData" ] != null ) {
		meta = (Hashtable)dict[ "metaData" ];
	    } else if( dict[ "metadata" ] != null ) {
		meta = (Hashtable)dict[ "metadata" ];
	    } else {
		meta = dict;
	    }
	    
	    strSongName = (string)meta[ "itemName" ];

            strTime = TimeSpan.FromSeconds(
                (int)meta[ "duration" ] / 1000 ).ToString();
            if( strTime.StartsWith( "00:" ) )
                strTime = strTime.Substring( 3 );
            strPrice = GetSongPrice( meta );

            if( meta[ "explicit" ] != null )
            {
                switch( (int)meta[ "explicit" ] )
                {
                    case 2:
                        strExplicit = "[C] ";
                        break;
                    case 1:
                        strExplicit = "[E] ";
                        break;
                }
            }

            songls.AppendValues( strExplicit + strSongName,
                                 meta[ "artistName" ],
                                 meta[ "playlistName" ],
                                 strTime, strPrice, i++ );
        }
    }

    private void DoSongMenuStateUpdate()
    {
        TreeIter iter;
        TreeModel model;
        TreeSelection sel = songtv.Selection;
        bool bPlaylistId = false;
        bool bBuyParams = false;
        bool bIsAlbum = false;
        bool bSel = false;

        if( ( bSel = sel.GetSelected( out model, out iter ) ) )
        {
            int index = (int)model.GetValue( iter, 5 );
            Hashtable song = (Hashtable)songs[ index ];
            bPlaylistId = song[ "playlistId" ] != null;
            bBuyParams = song[ "buyParams" ] != null ||
                         song[ "downloadKey" ] != null;
            bIsAlbum = song[ "isAlbum" ] != null &&
                       (bool)song[ "isAlbum" ] == true;
        }

        mipurchase.Sensitive = bSel && bBuyParams &&
                               !bIsAlbum && mipending.Sensitive;
        mipurchasealbum.Sensitive = bSel && bBuyParams &&
                                    bIsAlbum && mipending.Sensitive;
        miviewalbum.Sensitive = bSel && bPlaylistId && !bIsAlbum;
        mipreview.Sensitive = bSel;
    }

    private void OnTreeViewSelection( object o, EventArgs args )
    {
        DoSongMenuStateUpdate();
    }

    private void DoProgressUpdate( int pos, int total )
    {
        string strProgress = String.Format( "Downloaded {0}/{1} bytes",
                                            pos, total );
        RunOnMainThread.Run( this, "DoStatusbarUpdate",
            new object[] { cidProgress, strProgress, 3 } );
    }

    private void OnPurchase( object o, EventArgs args )
    {
        TreeIter iter;
        TreeModel model;
        TreeSelection sel = songtv.Selection;

        if( !sel.GetSelected( out model, out iter ) )
            return;

        bool Purchase = true;
        int index = (int)model.GetValue( iter, 5 );
        Hashtable song = (Hashtable)this.songs[ index ];

        if( song[ "downloadKey" ] == null )
        {
            Hashtable meta;

            PurchaseDialog dlg = new PurchaseDialog( MainWindow );

	    if( song[ "metaData" ] != null ) {
		    meta = (Hashtable)song[ "metaData" ];
	    } else if( song[ "metadata" ] != null ) {
		    meta = (Hashtable)song[ "metadata" ];
	    } else {
		    meta = song;
	    }

            if( song[ "isAlbum" ] != null && (bool)song[ "isAlbum" ] == true )
            {
                dlg.Title = "*";
                dlg.Artist = "*";
            }
            else
            {
                dlg.Title = (string)meta[ "itemName" ];
                dlg.Artist = (string)meta[ "artistName" ];
            }
            dlg.Album = (string)meta[ "playlistName" ];
            dlg.Price = GetSongPrice( meta );

            if( (ResponseType)dlg.Run() != ResponseType.Accept )
            {
                Purchase = false;
            }

            dlg.Destroy();
        }

        if( !Purchase )
            return;

        if( song[ "downloadKey" ] == null )
        {
            ThreadPool.QueueUserWorkItem( new WaitCallback(PurchaseThread),
                                          song );
        }
        else
        {
            ArrayList songs = new ArrayList();
            songs.Add( song );
            ThreadPool.QueueUserWorkItem( new WaitCallback(DownloadThread),
                                          songs );
        }
    }

    private void PurchaseThread( object State )
    {
        Hashtable song = (Hashtable)State;

        try
        {
            RunOnMainThread.Run( this, "DoStatusbarUpdate",
                new object[] { cidProgress, "Purchasing", 2 } );

            ArrayList songs = Store.Buy( song );

            RunOnMainThread.Run( this, "DoStatusbarUpdate",
                new object[] { cidProgress, null, 1 } );

            RunOnMainThread.Run( this, "DoStatusbarBalanceUpdate",
                new object[] { null } );

            ThreadPool.QueueUserWorkItem( new WaitCallback(DownloadThread),
                                          songs );
        }
        catch( Exception e )
        {
            RunOnMainThread.Run( this, "DoAlertBox",
                new object[] { AlertType.Error, e.Message } );
        }
    }

    private void DownloadThread( object State )
    {
        ArrayList songs = (ArrayList)State;

        mutex.WaitOne();

        foreach( Hashtable song in songs )
        {
            try
            {
                RunOnMainThread.Run( this, "DoStatusbarUpdate",
                    new object[] { cidProgress, "Downloading", 2 } );

                Hashtable meta;

                byte [] sb = Store.DownloadSong( song,
                    new FairStore.Progress( DoProgressUpdate ) );

                string strFileName;

                string [,] strReps = new string[,]
                {
                    { "\\", "-" }, { "/", "-" }, { ":", ""    },
                    { "*", ""   }, { "?", ""  }, { "\"", "\'" },
                    { "<", ""   }, { ">", ""  }, { "|", ""    }
                };

		if( song[ "metaData" ] != null ) {
		       	meta = (Hashtable)song[ "metaData" ];
	       	} else if( song[ "metadata" ] != null )	{
		       	meta = (Hashtable)song[ "metadata" ];
	       	} else {
		       	meta = song;
	       	}

		strFileName = String.Format( "{0} - {1} - {2}.m4a",
			meta[ "playlistArtistName" ], meta[ "playlistName" ],
			meta[ "itemName" ] );

                for( int i = 0; i < strReps.Length / 2; i++ )
                {
                    strFileName = strFileName.Replace( strReps[ i, 0 ],
                                                       strReps[ i, 1 ] );
                }

                string strPath = Path.Combine( strSongDir, strFileName );

                if( !File.Exists( strPath ) )
                {
                    FileStream fs =
                        new FileStream( strPath, FileMode.CreateNew );
                    BinaryWriter bw = new BinaryWriter( fs );
                    bw.Write( sb );
                    bw.Close();
                    fs.Close();
                }
            }
            catch( Exception e )
            {
                RunOnMainThread.Run( this, "DoAlertBox",
                    new object[] { AlertType.Error, e.Message } );
            }

            RunOnMainThread.Run( this, "DoStatusbarUpdate",
                new object[] { cidProgress, null, 1 } );
        }

        mutex.ReleaseMutex();
    }

    private void OnRedeemPepsiCap( object o, EventArgs args )
    {
        RedeemDialog dlg =
            new RedeemDialog( MainWindow, "Pepsi Cap", "Code" );
        switch( (ResponseType)dlg.Run() )
        {
            case ResponseType.Ok:
                ThreadPool.QueueUserWorkItem( new WaitCallback(PepsiThread),
                                              dlg.Text );
                break;

            default:
                break;
        }
        dlg.Destroy();
    }

    private void PepsiThread( object State )
    {
        string strCode = (string)State;

        try
        {
            Store.RedeemPepsiCap( strCode );
        }
        catch( Exception e )
        {
            RunOnMainThread.Run( this, "DoAlertBox",
                new object[] { AlertType.Error, e.Message } );
        }
    }

    private void OnRedeemGiftCertificate( object o, EventArgs args )
    {
        RedeemDialog dlg =
            new RedeemDialog( MainWindow, "Gift Certificate", "CertID" );
        switch( (ResponseType)dlg.Run() )
        {
            case ResponseType.Ok:
                ThreadPool.QueueUserWorkItem( new WaitCallback(GiftCertThread),
                                              dlg.Text );
                break;

            default:
                break;
        }
        dlg.Destroy();
    }

    private void GiftCertThread( object State )
    {
        string strCertID = (string)State;

        try
        {
            Store.RedeemGiftCertificate( strCertID );
            RunOnMainThread.Run( this, "DoStatusbarBalanceUpdate",
                new object[] { null } );
        }
        catch( Exception e )
        {
            RunOnMainThread.Run( this, "DoAlertBox",
                new object[] { AlertType.Error, e.Message } );
        }
    }

    private void OnRowActivated( object o, RowActivatedArgs args )
    {
        OnPreview( null, null );
    }

    private void OnPreview( object o, EventArgs args )
    {
        TreeIter iter;
        TreeModel model;
        TreeSelection sel = songtv.Selection;
        if( sel.GetSelected( out model, out iter ) )
        {
            int index = (int)model.GetValue( iter, 5 );
            Hashtable song = (Hashtable)songs[ index ];
            if( song[ "metaData" ] != null )
                song = (Hashtable)song[ "metaData" ];
            try
            {
                if( vlc == null )
                    vlc = new VLC();
                if( vlc.IsPlaying )
                {
                    vlc.Stop();
                }
                vlc.ClearPlaylist();
                vlc.AddTarget( (string)song[ "previewURL" ] );
                vlc.Play();
            }
            catch( Exception e )
            {
                RunOnMainThread.Run( this, "DoAlertBox",
                    new object[] { AlertType.Error, e.Message } );
            }
        }
    }

    [GLib.ConnectBefore]
    private void OnButtonPressEvent( object o, ButtonPressEventArgs args )
    {
        if( args.Event.Button == 3 )
        {
            TreePath path;
            TreeSelection sel = songtv.Selection;
            sel.UnselectAll();
            if( songtv.GetPathAtPos( (int)args.Event.X,
                                     (int)args.Event.Y, out path ) )
            {
                MenuItem mi;
                Menu ctxmenu;
                TreeIter iter;
                TreeModel model;
                bool IsAlbum = false;
                bool IsPending = false;

                sel.SelectPath( path );

                if( sel.GetSelected( out model, out iter ) )
                {
                    int index = (int)model.GetValue( iter, 5 );
                    Hashtable song = (Hashtable)songs[ index ];
                    IsPending = song[ "downloadKey" ] != null;
                    IsAlbum = song[ "playlistId" ] != null &&
                              (song[ "isAlbum" ] == null ||
                               (bool)song[ "isAlbum" ] == false);
                }

                ctxmenu = new Menu();

                mi = new MenuItem( "Preview" );
                mi.Activated += new EventHandler( OnPreview );
                mi.Sensitive = mipreview.Sensitive;
                ctxmenu.Append( mi );

                mi = new MenuItem( IsPending ? "Download" : "Purchase" );
                mi.Activated += new EventHandler( OnPurchase );
                mi.Sensitive = mipurchase.Sensitive |
                               mipurchasealbum.Sensitive;
                ctxmenu.Append( mi );

                if( IsPending )
                {
                    mi = new MenuItem( "Remove" );
                    mi.Activated += new EventHandler( OnRemovePendingSong );
                    mi.Sensitive = mipurchase.Sensitive;
                    ctxmenu.Append( mi );
                }

                if( IsAlbum )
                {
                    mi = new MenuItem( "View Album" );
                    mi.Activated += new EventHandler( OnViewAlbum );
                    mi.Sensitive = mipreview.Sensitive;
                    ctxmenu.Append( mi );
                }

                ctxmenu.ShowAll();
                ctxmenu.Popup( null, null, null, IntPtr.Zero,
                               args.Event.Button, args.Event.Time );
            }
            args.RetVal = true;
        }
    }

    private void OnRemovePendingSong( object o, EventArgs args )
    {
        TreeIter iter;
        TreeModel model;
        TreeSelection sel = songtv.Selection;
        if( sel.GetSelected( out model, out iter ) )
        {
            int index = (int)model.GetValue( iter, 5 );
            Hashtable song = (Hashtable)songs[ index ];

            songls.Remove( ref iter );

            ThreadPool.QueueUserWorkItem(
                new WaitCallback(RemovePendingSongThread), song );
        }
    }

    private void RemovePendingSongThread( object State )
    {
        Hashtable song = (Hashtable)State;

        try
        {
            Store.SongDownloadDone( song );
        }
        catch( Exception e )
        {
            RunOnMainThread.Run( this, "DoAlertBox",
                new object[] { AlertType.Error, e.Message } );
        }
    }

    private void OnSignup( object o, EventArgs args )
    {
        ThreadPool.QueueUserWorkItem( new WaitCallback(SignupThread) );
    }

    private void SignupThread( object State )
    {
        try
        {
            Hashtable form;

            if( State == null )
            {
                form = Store.Signup();
            }
            else
            {
                form = (Hashtable)State;
                form = Store.SignupStep( form );
            }

            RunOnMainThread.Run( this, "OnSignupEvent",
                new object[] { form } );
        }
        catch( Exception e )
        {
            RunOnMainThread.Run( this, "DoAlertBox",
                new object[] { AlertType.Error, e.Message } );
        }
    }

    private void OnSignupEvent( Hashtable form )
    {
        if( ((string)form[ "action" ]).Equals( "msg" ) )
        {
            new AlertDialog( this.MainWindow, AlertType.Info,
                             (string)form[ "title" ],
                             (string)form[ "msg" ] );
        }
        else
        {
            this.signupdata = form;

            Dialog dlg = new Dialog();
            dlg.Modal = true;
            dlg.Title = (string)form[ "title" ];
            dlg.SetSizeRequest( 500, -1 );

            HBox split = new HBox();
            dlg.VBox.Add( split );
            VBox left = new VBox( true, 0 );
            VBox right = new VBox( true, 0 );
            split.PackStart( left, false, false, 5 );
            split.PackEnd( right, true, true, 10 );

            NameValueCollection fields =
                (NameValueCollection)form[ "fields" ];
            Hashtable data = (Hashtable)form[ "data" ];

            foreach( string Key in fields.AllKeys )
            {
                Hashtable fd = (Hashtable)data[ Key ];

                string Name = Key.Substring( 0, 1 ).ToUpper() +
                              Key.Substring( 1 ) + ":";

                Label lbl = new Label( Name );
                lbl.SetAlignment( 0, (float)0.5 );
                left.PackStart( lbl, false, false, 5 );

                if( fields[ Key ].Equals( "TextEditView" ) )
                {
                    Entry ent = new Entry();
                    ent.Name = Key;
                    ent.ActivatesDefault = true;
                    if( fd[ "isPassword" ] != null )
                        ent.Visibility = false;
                    if( fd[ "value" ] != null )
                        ent.Text = (string)fd[ "value" ];
                    right.PackStart( ent, false, false, 5 );
                }
                else if( fields[ Key ].Equals( "PopupButtonView" ) )
                {
                    ComboBox cbox = ComboBox.NewText();
                    cbox.WrapWidth = 5;
                    cbox.Name = Key;
                    if( fd[ "menuItems" ] != null )
                    {
                        string menuItems = (string)fd[ "menuItems" ];
                        foreach( string Value in menuItems.Split( ',' ) )
                            cbox.AppendText( Value );
                        if( fd[ "value" ] != null &&
                            (string)fd[ "value" ] != String.Empty )
                        {
                            cbox.Active = Convert.ToInt32( fd[ "value" ] ) - 1;
                        }
                        else
                        {
                            cbox.Active = 0;
                        }
                    }
                    right.PackStart( cbox, false, false, 5 );
                }
                else if( fields[ Key ].Equals( "ComboControlView" ) )
                {
                    ComboBoxEntry cboxe = ComboBoxEntry.NewText();
                    cboxe.WrapWidth = 5;
                    cboxe.Name = Key;
                    if( fd[ "menuItems" ] != null )
                    {
                        string menuItems = (string)fd[ "menuItems" ];
                        foreach( string Value in menuItems.Split( ',' ) )
                            cboxe.AppendText( Value );
                    }
                    if( fd[ "value" ] != null )
                        ((Entry)cboxe.Child).Text = (string)fd[ "value" ];
                    right.PackStart( cboxe, false, false, 5 );
                }
                else if( fields[ Key ].Equals( "CheckboxView" ) )
                {
                    CheckButton cbtn = new CheckButton();
                    cbtn.Name = Key;
                    if( fd[ "value" ] != null &&
                        (string)fd[ "value" ] != String.Empty )
                    {
                        int v = Convert.ToInt32( (string)fd[ "value" ] );
                        cbtn.Active = v == 1;
                    }
                    right.PackStart( cbtn, false, false, 5 );
                }
            }

            dlg.AddActionWidget( new Button( "Cancel" ),
                                 ResponseType.Cancel );

            Button btn = new Button( "Next" );
            btn.CanDefault = true;
            dlg.AddActionWidget( btn, ResponseType.Ok );

            dlg.DefaultResponse = ResponseType.Ok;
            dlg.Response += new ResponseHandler( OnSignupResponse );

            dlg.TransientFor = this.MainWindow;
            dlg.SetPosition( WindowPosition.CenterOnParent );

            dlg.ShowAll();

            if( form[ "redtext" ] != null )
                new AlertDialog( dlg, AlertType.Warning,
                                 (string)form[ "title" ],
                                 (string)form[ "redtext" ] );
        }
    }

    private void OnSignupResponse( object o, ResponseArgs args )
    {
        ((Dialog)o).Hide();

        if( args.ResponseId != ResponseType.Ok )
            return;

        Hashtable form = (Hashtable)this.signupdata;
        NameValueCollection fields = (NameValueCollection)form[ "fields" ];

        Widget [] wgs = ((Dialog)o).VBox.Children;
        wgs = ((HBox)wgs[ 0 ]).Children;
        wgs = ((VBox)wgs[ 1 ]).Children;
        foreach( Widget wg in wgs )
        {
            switch( wg.GetType().Name )
            {
                case "Entry":
                    fields[ wg.Name ] = ((Entry)wg).Text;
                    break;
                case "ComboBox":
                    ComboBox cbox = (ComboBox)wg;
                    Hashtable data = (Hashtable)form[ "data" ];
                    Hashtable fd = (Hashtable)data[ wg.Name ];
                    if( fd[ "reqString" ] != null )
                    {
                        TreeIter iter;
                        cbox.GetActiveIter( out iter );
                        fields[ wg.Name ] =
                            (string)cbox.Model.GetValue( iter, 0 );
                    }
                    else
                    {
                        fields[ wg.Name ] =
                            Convert.ToString( cbox.Active + 1 );
                    }
                    break;
                case "ComboBoxEntry":
                    ComboBoxEntry cboxe = (ComboBoxEntry)wg;
                    fields[ wg.Name ] = ((Entry)cboxe.Child).Text;
                    break;
                case "CheckButton":
                    CheckButton cbtn = (CheckButton)wg;
                    fields[ wg.Name ] = cbtn.Active ? "1" : "0";
                    break;
            }
        }

        ThreadPool.QueueUserWorkItem( new WaitCallback(SignupThread), form );
    }

    private void OnViewAlbum( object o, EventArgs args )
    {
        TreeIter iter;
        TreeModel model;
        TreeSelection sel = songtv.Selection;

        if( !sel.GetSelected( out model, out iter ) )
            return;

        int index = (int)model.GetValue( iter, 5 );
        Hashtable song = (Hashtable)songs[ index ];

        ThreadPool.QueueUserWorkItem(
            new WaitCallback(ViewAlbumThread), song[ "playlistId" ] );
    }

    private void ViewAlbumThread( object State )
    {
        string strPlaylistId = State.ToString();

        try
        {
            songs = Store.ViewAlbum( strPlaylistId );
            RunOnMainThread.Run( this, "DoTreeViewUpdate",
                                 new object[] { null } );
        }
        catch( Exception e )
        {
            RunOnMainThread.Run( this, "DoAlertBox",
                new object[] { AlertType.Error, e.Message } );
        }
    }
}

/* http://eric.extremeboredom.net/2004/12/25/113/ */
public class RunOnMainThread
{
    private object methodClass;
    private string methodName;
    private object[] arguments;

    public static void Run( object methodClass, string methodName,
                            object[] arguments )
    {
        new RunOnMainThread( methodClass, methodName, arguments );
    }

    public RunOnMainThread( object methodClass, string methodName,
                            object[] arguments )
    {
        this.methodClass = methodClass;
        this.methodName = methodName;
        this.arguments = arguments;
        GLib.Idle.Add( new IdleHandler(Go) );
    }

    private bool Go()
    {
        methodClass.GetType().InvokeMember( methodName, BindingFlags.Default |
            BindingFlags.Public | BindingFlags.NonPublic |
            BindingFlags.Instance | BindingFlags.InvokeMethod,
            null, methodClass, arguments );
        return false;
    }
}
