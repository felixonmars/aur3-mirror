/*
 * Copyright (C) 2008  kroimon
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 as published
 * by the Free Software Foundation.
 */

#include "User.h"
#include "Modules.h"
#include "string.h"
#include "Chan.h"

class CAmsgFilterModule : public CModule {
public:
	MODCONSTRUCTOR(CAmsgFilterModule) {}
	virtual ~CAmsgFilterModule() {}

	virtual bool OnLoad(const CString& sArgs, CString& sMessage) {
		unsigned int i = 0;
		CString sChan = sArgs.Token(i++);
		while (!sChan.empty()) {
			if (!Add(sChan))
				PutModule("Unable to add [" + sChan + "]");
			sChan = sArgs.Token(i++);
		}

		// Load our saved settings, ignore errors
		for (MCString::iterator it = BeginNV(); it != EndNV(); it++)
			Add(it->first);

		return true;
	}

	virtual EModRet OnUserMsg(CString& sTarget, CString& sMessage) {
		SCString sTargets;
		sTarget.Split(",", sTargets);

		if (IsAmsg(sTargets)) {
			sTarget.clear();
			for (SCString::iterator itTarget = sTargets.begin(); itTarget != sTargets.end(); itTarget++) {
				if (!IsFiltered(*itTarget)) {
					if (!sTarget.empty())
						sTarget.append(",");
					sTarget.append(*itTarget);
				} else {
					PutUser(":" + GetModNick() + " PRIVMSG " + *itTarget + " :amsg blocked in this channel: " + sMessage);
				}
			}
		}

		return CONTINUE;
	}

	virtual void OnModCommand(const CString& sLine) {
		CString sCommand = sLine.Token(0).AsLower();

		if (sCommand == "add") {
			CString sChan = sLine.Token(1);
			if (AlreadyAdded(sChan)) {
				PutModule(sChan + " is already added");
			} else if (Add(sChan)) {
				PutModule("Added " + sChan + " to amsg filter list");
			} else {
				PutModule("Usage: Add [!]<#chan>");
			}

		} else if (sCommand == "del") {
			CString sChan = sLine.Token(1);
			if (Del(sChan))
				PutModule("Removed " + sChan + " from amsg filter list");
			else
				PutModule("Usage: Del [!]<#chan>");

		} else if (sCommand == "list") {
			CTable Table;
			Table.AddColumn("Channel");

			for (unsigned int i = 0; i < vsChans.size(); i++) {
				Table.AddRow();
				Table.SetCell("Channel", vsChans[i]);
			}

			for (unsigned int i = 0; i < vsNegChans.size(); i++) {
				Table.AddRow();
				Table.SetCell("Channel", "!" + vsNegChans[i]);
			}

			if (Table.size()) {
				unsigned int i = 0;
				CString sTmp;
				while (Table.GetLine(i++, sTmp))
					PutModule(sTmp);
			} else
				PutModule("You have no amsg filters");

		} else if (sCommand == "help") {
			CTable Table;
			Table.AddColumn("Command");
			Table.AddColumn("Description");

			Table.AddRow();
			Table.SetCell("Command", "Add");
			Table.SetCell("Description", "Add an entry, use !#chan to negate and * for wildcards");

			Table.AddRow();
			Table.SetCell("Command", "Del");
			Table.SetCell("Description", "Remove an entry, needs to be an exact match");

			Table.AddRow();
			Table.SetCell("Command", "List");
			Table.SetCell("Description", "List all entries");

			unsigned int uTableIdx = 0;
			CString sTmp;

			while (Table.GetLine(uTableIdx++, sTmp))
				PutModule(sTmp);
		}
	}


private:
	VCString vsChans;
	VCString vsNegChans;

	bool IsAmsg(SCString& sTargets) {
		/* amsgs can't go to just one channel */
		if (sTargets.size() == 1)
			return false;

		/* check that sTargets includes all attached channels */
		const vector<CChan*>& vChans = m_pUser->GetChans();
		for (unsigned int i = 0; i < vChans.size(); i++) {
			CChan* pChan = vChans[i];
			if (pChan->IsDetached())
				continue;
			SCString::iterator it = sTargets.find(pChan->GetName());
			if (it == sTargets.end())
				return false;
		}

		return true;
	}

	bool IsFiltered(const CString& sChan) {
		for (unsigned int i = 0; i < vsNegChans.size(); i++)
			if (sChan.WildCmp(vsNegChans[i]))
				return false;
		for (unsigned int i = 0; i < vsChans.size(); i++)
			if (sChan.WildCmp(vsChans[i]))
				return true;
		return false;
	}

	bool AlreadyAdded(const CString& sInput) {
		VCString::iterator it;

		if (sInput.Left(1) == "!") {
			CString sChan = sInput.substr(1);
			for (it = vsNegChans.begin(); it != vsNegChans.end(); it++)
				if (*it == sChan)
					return true;
		} else {
			for (it = vsChans.begin(); it != vsChans.end(); it++)
				if (*it == sInput)
					return true;
		}
		return false;
	}

	bool Add(const CString& sChan) {
		if (sChan.empty() || sChan == "!")
			return false;

		if (sChan.Left(1) == "!")
			vsNegChans.push_back(sChan.substr(1));
		else
			vsChans.push_back(sChan);

		// Also save it for next module load
		SetNV(sChan, "");

		return true;
	}

	bool Del(const CString& sChan) {
		VCString::iterator it, end;

		if (sChan.empty() || sChan == "!")
			return false;

		if (sChan.Left(1) == "!") {
			CString sTmp = sChan.substr(1);
			it  = vsNegChans.begin();
			end = vsNegChans.end();

			for (; it != end; it++)
				if (*it == sTmp)
					break;

			if (it == end)
				return false;

			vsNegChans.erase(it);
		} else {
			it  = vsChans.begin();
			end = vsChans.end();

			for (; it != end; it++)
				if (*it == sChan)
					break;

			if (it == end)
				return false;

			vsChans.erase(it);
		}

		DelNV(sChan);

		return true;
	}

};

MODULEDEFS(CAmsgFilterModule, "Excludes channels from amsgs")
