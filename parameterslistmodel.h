#ifndef PARAMETERSLISTMODEL_H
#define PARAMETERSLISTMODEL_H

#include <QAbstractListModel>

enum ParametersListModel_e {
    ParametersListModel_value = Qt::UserRole + 1,
    ParametersListModel_valuePrev,
    ParametersListModel_color,
    ParametersListModel_pieValue,
    ParametersListModel_piePrev
};

class ParametersListModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit ParametersListModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex &index) const override;
    QHash<int,QByteArray> roleNames() const override;

    double getMaxValue() const;

signals:
    void maxValueChanged(double value);

private:
    QList<double> m_values;
    QStringList m_colors;
};

#endif // PARAMETERSLISTMODEL_H
