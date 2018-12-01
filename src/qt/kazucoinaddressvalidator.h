// Copyright (c) 2011-2014 The Kazucoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef KAZUCOIN_QT_KAZUCOINADDRESSVALIDATOR_H
#define KAZUCOIN_QT_KAZUCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class KazucoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit KazucoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Kazucoin address widget validator, checks for a valid kazucoin address.
 */
class KazucoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit KazucoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // KAZUCOIN_QT_KAZUCOINADDRESSVALIDATOR_H
